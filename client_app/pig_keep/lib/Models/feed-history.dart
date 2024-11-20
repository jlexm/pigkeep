import 'package:isar/isar.dart';
import 'package:uuid/uuid.dart';

part 'feed-history.g.dart';

@Collection()
class FeedHistory {
  Id isarID = Isar.autoIncrement;

  @Index()
  String uuid = Uuid().v4();

  late String? _id; // mongodb ID

  @Index()
  late String feedType;
  double weightKG = 0;
  double cost = 0;

  // consumed or stock
  String status = 'stock';

  @Index()
  late String farmID;

  DateTime createdAt = DateTime.now();
  DateTime updatedAt = DateTime.now();
}
