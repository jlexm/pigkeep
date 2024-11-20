import 'package:isar/isar.dart';
import 'package:uuid/uuid.dart';

part 'feed.g.dart';

@Collection()
class Feed {
  Id isarID = Isar.autoIncrement;

  @Index()
  String uuid = Uuid().v4();

  late String? _id; // mongodb ID

  @Index()
  late String feedType;
  double weightKG = 0;
  double cost = 0;

  @Index()
  late String farmID;

  DateTime createdAt = DateTime.now();
  DateTime updatedAt = DateTime.now();
}
