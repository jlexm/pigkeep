import 'dart:convert';

import 'package:isar/isar.dart';
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

    if (pen.currentPigCount >= pen.maxPigCount) {
      throw 'Pen is full of pigs';
    }

    // update current pen's current pig count
    pen.currentPigCount += 1;

    await db.writeTxn(() async {
      await db.pigs.put(newPig);
      await db.pigPens.put(pen);
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
    return await db.pigs.filter().penUuidEqualTo(penUuid).findAll();
  }

  Future<List<Map<String, dynamic>>> fetchAllPigsInAllPens(
      List<PigPen> pens) async {
    List<Map<String, dynamic>> pigs = [];

    // get all pigs from pens
    await Future.wait(pens.map((pen) async {
      final penPigs = await fetchPigsInPen(pen.uuid);
      penPigs.forEach((penPig) {
        // calculate pig stage
        final pigStage = PigHelper.determinePigStage(penPig.dob);

        Map<String, dynamic> newPig = {
          'uuid': penPig.uuid,
          'pigNumber': penPig.pigNumber,
          'penUuid': penPig.penUuid,
          'penNumber': pen.penNumber,
          'dob': penPig.dob,
          'status': penPig.status,
          'currentFeed': pigStage['feed'],
          'ageCategory': pigStage['stage']
        };
        pigs.add(newPig);
      });
    }));

    return pigs;
  }
}
