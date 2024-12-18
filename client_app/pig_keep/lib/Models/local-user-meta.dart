import 'package:isar/isar.dart';
import 'package:uuid/uuid.dart';

part 'local-user-meta.g.dart';

@Collection()
class LocalUserMeta {
  Id isarID = Isar.autoIncrement;

  @Index()
  late String farmID;

  late String
      model; // pig-pen, pig, feed, feed-history, ledger, medicine, medicine-history, pig-event
  late DateTime? lastSuccesfulReadSync; // download data from api
  late DateTime? lastSuccesfulWriteSync; // upload data from api

  DateTime createdAt = DateTime.now();
  DateTime updatedAt = DateTime.now();
}
