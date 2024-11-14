import 'package:isar/isar.dart';
import 'package:uuid/uuid.dart';

part 'medicine-history.g.dart';

@Collection()
class MedicineHistory {
  Id isarID = Isar.autoIncrement;

  @Index()
  String uuid = Uuid().v4();

  late String? _id; // mongodb ID

  @Index()
  late String medicineName;
  // mg, mL String? unit;
  late String dosage;
  int quantity = 0;
  double cost = 0;

  // consumed or stock
  String status = 'stock';

  @Index()
  String? pigUuid;

  @Index()
  late String farmID;

  DateTime createdAt = DateTime.now();
  DateTime updatedAt = DateTime.now();
}
