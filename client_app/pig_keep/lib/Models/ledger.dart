import 'package:isar/isar.dart';
import 'package:uuid/uuid.dart';

part 'ledger.g.dart';

@Collection()
class Ledger {
  Id isarID = Isar.autoIncrement;

  @Index()
  late String? userOwner;

  @Index()
  String uuid = Uuid().v4();

  late String? _id; // mongodb ID

  // deceased or sold
  String status = 'deceased';

  DateTime transactionDate = DateTime.now();

  double? priceSold = null;

  double? weightKG = null;

  @Index()
  late String pigUuid;

  @Index()
  late String farmID;

  DateTime createdAt = DateTime.now();
  DateTime updatedAt = DateTime.now();
}
