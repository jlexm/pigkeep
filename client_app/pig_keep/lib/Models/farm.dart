import 'package:isar/isar.dart';

part 'farm.g.dart';

@Collection()
class Farm {
  Id isarID = Isar.autoIncrement;

  late String? _id; // mongodb ID

  @Index()
  late String farmName;

  late String farmAddress;

  @Index()
  late String ownerID; // connect

  DateTime createdAt = DateTime.now();
  DateTime updatedAt = DateTime.now();
}
