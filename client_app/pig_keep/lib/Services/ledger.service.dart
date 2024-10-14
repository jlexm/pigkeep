import 'package:isar/isar.dart';
import 'package:pig_keep/Models/ledger.dart';
import 'package:pig_keep/Models/pig-pen.dart';
import 'package:pig_keep/Models/pig.dart';
import 'package:pig_keep/Services/database-service.dart';
import 'package:pig_keep/main.dart';

class LedgerService {
  Isar db = globalLocator.get<DatabaseService>().db;

  Future<void> ledgePig(String status, String userOwner, String farmID,
      String pigUuid, String penUuid, double priceSold, double weightKG) async {
    var ledger = Ledger()
      ..userOwner = userOwner
      ..farmID = farmID
      ..pigUuid = pigUuid
      ..priceSold = priceSold
      ..weightKG = weightKG
      ..status = status;

    // check if pig is sold
    Pig? pig = await db.pigs.filter().uuidEqualTo(pigUuid).findFirst();

    if (pig == null) {
      throw 'Pig not found';
    }
    if (pig.status != 'alive') {
      throw 'Pig already sold or deceased';
    }

    pig.status = status;
    pig.weightKG = weightKG;
    pig.updatedAt = DateTime.now();

    PigPen? pen = await db.pigPens.filter().uuidEqualTo(penUuid).findFirst();
    if (pen == null) {
      throw 'Pen not found';
    }

    // update current pen's current pig count
    pen.currentPigCount -= 1;
    pen.updatedAt = DateTime.now();

    await db.writeTxn(() async {
      await db.pigs.put(pig);
      await db.pigPens.put(pen);
      await db.ledgers.put(ledger);
    });
  }

  Future<Map<String, dynamic>> getLedgers(String farmID) async {
    var fetchedLedgers = await db.ledgers
        .filter()
        .farmIDEqualTo(farmID)
        .sortByCreatedAtDesc()
        .findAll();
    List<Map<String, dynamic>> ledgers = [];
    double totalEarned = 0;

    for (var ledger in fetchedLedgers) {
      final pig =
          await db.pigs.filter().uuidEqualTo(ledger.pigUuid).findFirst();

      if (pig == null) {
        continue;
      }

      if (ledger.status == 'sold') {
        totalEarned += ledger.priceSold ?? 0;
      }

      ledgers.add({
        'uuid': ledger.uuid,
        'transactionDate': ledger.transactionDate.toString(),
        'status': ledger.status,
        'pigUuid': ledger.pigUuid,
        'pigNumber': pig.pigNumber,
        'weightKG': ledger.weightKG,
        'priceSold': ledger.priceSold
      });
    }

    return {'ledgers': ledgers, 'totalEarned': totalEarned};
  }
}
