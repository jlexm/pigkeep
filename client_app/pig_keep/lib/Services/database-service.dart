import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pig_keep/Models/ledger.dart';
import 'package:pig_keep/Models/pig-pen.dart';
import 'package:pig_keep/Models/pig.dart';

class DatabaseService {
  late Isar db;

  Future<void> init() async {
    print('Isar DB initialized.');
    final dir = await getApplicationDocumentsDirectory();
    db = await Isar.open([PigPenSchema, PigSchema, LedgerSchema],
        directory: dir.path);
  }
}
