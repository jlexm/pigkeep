import 'package:isar/isar.dart';
import 'package:uuid/uuid.dart';

part 'medicine.g.dart';

@Collection()
class Medicine {
  Id isarID = Isar.autoIncrement;

  @Index()
  String uuid = Uuid().v4();

  late String? _id; // mongodb ID

  @Index(unique: true)
  late String medicineName;
  //String? unit; // mg or mL
  late String dosage;
  late String description;
  int quantity = 0;
  double avgCost = 0;

  @Index()
  late String farmID;

  DateTime createdAt = DateTime.now();
  DateTime updatedAt = DateTime.now();
}
