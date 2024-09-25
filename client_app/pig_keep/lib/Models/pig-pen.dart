import 'package:isar/isar.dart';
import 'package:uuid/uuid.dart';

part 'pig-pen.g.dart';

@Collection()
class PigPen {
  Id isarID = Isar.autoIncrement;

  @Index()
  late String? userOwner;

  @Index()
  String uuid = Uuid().v4();

  late String? _id; // mongodb ID

  @Index()
  late String penNumber;

  @Index()
  late String penType;

  @Index()
  late String farmID; // connect

  late int maxPigCount;

  late int currentPigCount;

  DateTime createdAt = DateTime.now();
  DateTime updatedAt = DateTime.now();
}
