import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pig_keep/Models/feed-history.dart';
import 'package:pig_keep/Models/feed.dart';
import 'package:pig_keep/Models/ledger.dart';
import 'package:pig_keep/Models/medicine-history.dart';
import 'package:pig_keep/Models/medicine.dart';
import 'package:pig_keep/Models/pig-event.dart';
import 'package:pig_keep/Models/pig-pen.dart';
import 'package:pig_keep/Models/pig.dart';

class DatabaseService {
  late Isar db;

  Future<void> init() async {
    print('Isar DB initialized.');
    final dir = await getApplicationDocumentsDirectory();
    db = await Isar.open([
      PigPenSchema,
      PigSchema,
      LedgerSchema,
      MedicineSchema,
      MedicineHistorySchema,
      FeedSchema,
      FeedHistorySchema,
      PigEventSchema,
    ], directory: dir.path);
  }
}
