import 'package:isar/isar.dart';
import 'package:pig_keep/Models/pig-pen.dart';
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

  Future<PigPen?> getLastPigPen(String farmID, String userOwner) async {
    return await db.pigPens
        .filter()
        .userOwnerEqualTo(userOwner)
        .farmIDEqualTo(farmID)
        .findFirst();
  }
}
