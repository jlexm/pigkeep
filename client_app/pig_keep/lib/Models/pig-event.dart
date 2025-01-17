import 'package:isar/isar.dart';
import 'package:uuid/uuid.dart';

part 'pig-event.g.dart';

@Collection()
class PigEvent {
  Id isarID = Isar.autoIncrement;

  @Index()
  String uuid = Uuid().v4();

  late String? _id; // mongodb ID

  late DateTime eventDate;
  late String pigUuid;
  late String pigNumber;

  // Pending, In Progress, Completed, Deleted
  late String? status;

  // Vaccination, Farrow
  late String eventType;

  @Index()
  late String farmID;

  DateTime createdAt = DateTime.now();
  DateTime updatedAt = DateTime.now();
}
