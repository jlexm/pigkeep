import 'package:isar/isar.dart';
import 'package:uuid/uuid.dart';

part 'pig.g.dart';

@Collection()
class Pig {
  Id isarID = Isar.autoIncrement;

  @Index()
  late String userOwner;

  @Index()
  late String penUuid;

  @Index()
  late String pigNumber;

  @Index()
  late String farmID;

  @Index()
  late String? parentUuid;

  @Index()
  late String uuid = Uuid().v4();

  late String? _id; // mongodb ID

  late DateTime dob;
  late bool sex;
  late String status = 'alive'; // alive, deceased, sold

  late double weightKG;
  late DateTime lastWeightRecorded;

  DateTime createdAt = DateTime.now();
  DateTime updatedAt = DateTime.now();
}
