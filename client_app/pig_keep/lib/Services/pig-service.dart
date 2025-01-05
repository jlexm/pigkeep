import 'dart:convert';

import 'package:isar/isar.dart';
import 'package:pig_keep/Models/ledger.dart';
import 'package:pig_keep/Models/pig-pen.dart';
import 'package:pig_keep/Models/pig.dart';
import 'package:pig_keep/Services/database-service.dart';
import 'package:pig_keep/Services/pig-helper.dart';
import 'package:pig_keep/main.dart';

class PigService {
  Isar db = globalLocator.get<DatabaseService>().db;

  Future<void> addPig(String userOwner, String farmID, String penUuid,
      String pigNumber, String? parentUuid, bool sex, DateTime dob) async {
    final newPig = Pig()
      ..farmID = farmID
      ..parentUuid = parentUuid == '' ? null : parentUuid
      ..penUuid = penUuid
      ..userOwner = userOwner
      ..dob = dob
      ..pigNumber = pigNumber
      ..sex = sex;

    // get pen
    PigPen? pen = await db.pigPens.filter().uuidEqualTo(penUuid).findFirst();

    if (pen == null) {
      throw 'Pen not found';
    }

    if (pen.penType == 'Farrowing' && newPig.sex) {
      throw 'Cannot put male pig in farrowing';
    }

    if (pen.currentPigCount >= pen.maxPigCount) {
      throw '${pen.penType} Pen: ${pen.penNumber} is full of pigs.';
    }

    // update current pen's current pig count
    pen.currentPigCount += 1;
    pen.updatedAt = DateTime.now();

    await db.writeTxn(() async {
      await db.pigs.put(newPig);
      await db.pigPens.put(pen);
    });
  }

  Future<void> updatePigDetails(String uuid, String farmID, String penUuid,
      bool sex, DateTime dob, String pigNumber, double? weightKG) async {
    // get pig
    Pig? pig = await db.pigs.filter().uuidEqualTo(uuid).findFirst();

    if (pig == null) {
      throw 'Pig not found';
    }

    // update data if not the same on db
    if (pig.pigNumber != pigNumber) {
      // check if pigNumber exists
      Pig? existingPig = await db.pigs
          .filter()
          .farmIDEqualTo(farmID)
          .pigNumberEqualTo(pigNumber)
          .findFirst();
      if (existingPig != null) {
        throw 'Pig Number already exists';
      }
      pig.pigNumber = pigNumber;
    }
    if (pig.sex != sex) {
      pig.sex = sex;
    }
    if (pig.dob != dob) {
      pig.dob = dob;
    }
    if (pig.weightKG != weightKG) {
      pig.weightKG = weightKG;
      pig.lastWeightRecorded = DateTime.now();
    }

    pig.updatedAt = DateTime.now();

    // get pen
    PigPen? pen = await db.pigPens.filter().uuidEqualTo(penUuid).findFirst();
    PigPen? oldPen =
        await db.pigPens.filter().uuidEqualTo(pig.penUuid).findFirst();

    if (pen == null || oldPen == null) {
      throw 'Pen not found';
    }

    if (pen.penType == 'Farrowing' && pig.sex) {
      throw 'Cannot put male pig in farrowing';
    }

    if (pig.penUuid != penUuid) {
      // update current pig count of old pen
      oldPen.currentPigCount -= 1;
      oldPen.updatedAt = DateTime.now();

      pig.penUuid = penUuid;

      if (pen.currentPigCount >= pen.maxPigCount) {
        throw '${pen.penType} Pen: ${pen.penNumber} is full of pigs.';
      }

      // update current pen's current pig count
      pen.currentPigCount += 1;
      pen.updatedAt = DateTime.now();
    }

    await db.writeTxn(() async {
      await db.pigs.put(pig);
      await db.pigPens.put(pen);
      await db.pigPens.put(oldPen);
    });
  }

  Future<List<Pig>> fetchPigs(
    String userOwner,
    String farmID,
  ) async {
    return await db.pigs
        .filter()
        .userOwnerEqualTo(userOwner)
        .farmIDEqualTo(farmID)
        .findAll();
  }

  Future<List<Pig>> fetchPigsInPen(
    String penUuid,
  ) async {
    return await db.pigs
        .filter()
        .penUuidEqualTo(penUuid)
        .sortByCreatedAtDesc()
        .findAll();
  }

  Future<List<Map<String, dynamic>>> fetchAllPigsInAllPens(
      List<PigPen> pens) async {
    List<Map<String, dynamic>> pigs = [];

    // get all pigs from pens
    await Future.wait(pens.map((pen) async {
      final penPigs = await fetchPigsInPen(pen.uuid);
      penPigs.forEach((penPig) {
        // calculate pig stage
        final pigStage = PigHelper.determinePigStage(penPig.sex, penPig.dob);

        Map<String, dynamic> newPig = {
          'uuid': penPig.uuid,
          'pigNumber': penPig.pigNumber,
          'penUuid': penPig.penUuid,
          'penNumber': pen.penNumber,
          'dob': penPig.dob,
          'status': penPig.status,
          'currentFeed': pigStage['feed'],
          'ageCategory': pigStage['stage'],
          'createdAt': penPig.createdAt
        };
        pigs.add(newPig);
      });
    }));

    // sort desc
    pigs.sort((a, b) => b['createdAt'].compareTo(a['createdAt']));

    return pigs;
  }

  Future<Map<String, dynamic>> fetchPigDetails(String uuid) async {
    final pig = await db.pigs.filter().uuidEqualTo(uuid).findFirst();
    if (pig == null) {
      throw 'Pig not found.';
    }

    final pen = await db.pigPens.filter().uuidEqualTo(pig.penUuid).findFirst();
    if (pen == null) {
      throw 'Pig not found in pen';
    }

    final ledger =
        await db.ledgers.filter().pigUuidEqualTo(pig.uuid).findFirst();

    String? parentPigNumber;
    if (pig.parentUuid != null) {
      final parentPig = await db.pigs
          .filter()
          .uuidEqualTo(pig.parentUuid as String)
          .findFirst();
      if (parentPig != null) {
        parentPigNumber = parentPig.pigNumber;
      }
    }

    // todo get ledger details

    final pigStage = PigHelper.determinePigStage(pig.sex, pig.dob);

    return {
      'uuid': uuid,
      'pigNumber': pig.pigNumber,
      'penUuid': pig.penUuid,
      'penNumber': pen.penNumber,
      'parentPigNumber': parentPigNumber,
      'dob': pig.dob,
      'sex': pig.sex,
      'weightKG': pig.weightKG,
      'lastWeightRecorded': pig.lastWeightRecorded,
      'status': pig.status,
      'currentFeed': pigStage['feed'],
      'ageCategory': pigStage['stage'],
      'age': pigStage['age'],
      'priceSold': ledger?.priceSold,
      'transactionDate': ledger?.transactionDate,
    };
  }

  Future<Pig?> fetchPigByNumber(String pigNumber, String farmID) async {
    return db.pigs
        .filter()
        .farmIDEqualTo(farmID)
        .pigNumberEqualTo(pigNumber)
        .findFirst();
  }

  Future<Pig?> fetchPigByUuid(String uuid, String farmID) async {
    return db.pigs.filter().farmIDEqualTo(farmID).uuidEqualTo(uuid).findFirst();
  }
}
