import 'package:isar/isar.dart';
import 'package:pig_keep/Models/pig-pen.dart';
import 'package:pig_keep/Models/pig.dart';
import 'package:pig_keep/Services/database-service.dart';
import 'package:pig_keep/main.dart';

class PigPenService {
  Isar db = globalLocator.get<DatabaseService>().db;

  Future<void> addPigPen(String penNumber, String penType, int maxPigCount,
      String farmID, String userOwner) async {
    final newPigPen = PigPen()
      ..userOwner = userOwner
      ..farmID = farmID
      ..penType = penType
      ..maxPigCount = maxPigCount
      ..currentPigCount = 0
      ..penNumber = penNumber;
    await db.writeTxn(() => db.pigPens.put(newPigPen));
  }

  Future<List<PigPen>> fetchPigPens(String farmID, String userOwner) async {
    return await db.pigPens
        .filter()
        .userOwnerEqualTo(userOwner)
        .farmIDEqualTo(farmID)
        .findAll();
  }

  Future<List<dynamic>> getPensWithPigs(String farmID, String userOwner) async {
    final pens = await db.pigPens
        .filter()
        .userOwnerEqualTo(userOwner)
        .farmIDEqualTo(farmID)
        .findAll();

    List<dynamic> pensWithPigs = [];

    for (var pen in pens) {
      var pigs = await db.pigs
          .filter()
          .penUuidEqualTo(pen.uuid)
          .statusEqualTo('alive')
          .findAll();
      pensWithPigs.add({
        'userOwner': pen.userOwner,
        'uuid': pen.uuid,
        'penNumber': pen.penNumber,
        'penType': pen.penType,
        'farmID': pen.farmID,
        'maxPigCount': pen.maxPigCount,
        'currentPigCount': pen.currentPigCount,
        'createdAt': pen.createdAt, // Convert DateTime to ISO8601 format
        'updatedAt': pen.updatedAt,
        'pigs': pigs
      });
    }

    return pensWithPigs;
  }

  Future<PigPen?> getLastPigPen(String farmID, String userOwner) async {
    return await db.pigPens
        .filter()
        .userOwnerEqualTo(userOwner)
        .farmIDEqualTo(farmID)
        .findFirst();
  }

  Future<PigPen?> getPigPenDetails(String uuid) async {
    final pen = await db.pigPens.filter().uuidEqualTo(uuid).findFirst();
    if (pen == null) {
      throw 'Pen not found.';
    }
    return pen;
  }

  Future<void> updatePigPenDetails(
      String uuid, String penType, int maxPigCount) async {
    final pen = await db.pigPens.filter().uuidEqualTo(uuid).findFirst();
    if (pen == null) {
      throw 'Pen not found.';
    }
    // update current pen's current pig count
    pen.maxPigCount = maxPigCount;
    // update pen type
    pen.penType = penType;

    pen.updatedAt = DateTime.now();

    await db.writeTxn(() async {
      await db.pigPens.put(pen);
    });
  }
}
