import 'package:isar/isar.dart';
import 'package:pig_keep/Models/pig.dart';
import 'package:pig_keep/Services/database-service.dart';
import 'package:pig_keep/main.dart';

class PigService {
  Isar db = globalLocator.get<DatabaseService>().db;

  Future<void> addPig(String userOwner, String farmID, String penUuid,
      String pigNumber, String? parentUuid, bool sex, DateTime dob) async {
    final newPig = Pig()
      ..farmID = farmID
      ..parentUuid = parentUuid
      ..penUuid = penUuid
      ..userOwner = userOwner
      ..dob = dob
      ..pigNumber = pigNumber
      ..sex = sex;

    await db.writeTxn(() => db.pigs.put(newPig));
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
    String userOwner,
    String penUuid,
  ) async {
    return await db.pigs
        .filter()
        .userOwnerEqualTo(userOwner)
        .penUuidEqualTo(penUuid)
        .findAll();
  }
}
