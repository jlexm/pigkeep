import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pig_keep/Models/pig-pen.dart';

class DatabaseService {
  late Isar db;

  Future<void> init() async {
    print('Isar DB initialized.');
    final dir = await getApplicationDocumentsDirectory();
    db = await Isar.open([PigPenSchema], directory: dir.path);
  }
}
