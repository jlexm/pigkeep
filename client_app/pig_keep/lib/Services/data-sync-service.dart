import 'dart:convert';

import 'package:isar/isar.dart';
import 'package:pig_keep/Api/pen_api.dart';
import 'package:pig_keep/Api/pig_api.dart';
import 'package:pig_keep/Models/local-user-meta.dart';
import 'package:pig_keep/Models/pig-pen.dart';
import 'package:pig_keep/Models/pig.dart';
import 'package:pig_keep/Services/database-service.dart';
import 'package:pig_keep/Services/pig-helper.dart';
import 'package:pig_keep/main.dart';

class DataSyncService {
  /* 
    Main sync logic:
     - Sync identifier using date such as lastSyncReadDate, lasySyncWriteData
     - models that it points to eg pig-pens, pigs, etc...
     - 10 rows at a time (sync batching)
     - data conflict resolver: which ever's the latest updatedAt
     - if model's local UUID matches from api, then merge to local
   */
  Isar db = globalLocator.get<DatabaseService>().db;

  Future<void> syncAllData(String farmID, String userOwner) async {
    await syncPigPens(farmID, userOwner);
    await syncPig(farmID, userOwner);
  }

  /* SYNC PIG PENS */
  Future<void> syncPigPens(String farmID, String userOwner) async {
    try {
      final String model = 'pig-pen';
      LocalUserMeta? localUserMeta = await db.localUserMetas
          .filter()
          .farmIDEqualTo(farmID)
          .modelEqualTo(model)
          .findFirst();

      localUserMeta ??= LocalUserMeta()
        ..farmID = farmID
        ..model = model
        ..lastSuccesfulReadSync = null
        ..lastSuccesfulWriteSync = null;

      final DateTime? lastSyncReadDate = localUserMeta.lastSuccesfulReadSync;
      final DateTime? lastSyncWriteDate = localUserMeta.lastSuccesfulWriteSync;
      final DateTime now = DateTime.now();

      // get all pig pens from api greater than local last sync date
      final List<dynamic> apiPigPens =
          await PenApi.getSyncablePen(farmID, lastSyncReadDate);

      final apiPigPenBatches = PigHelper.splitArrayIntoBatches(apiPigPens, 10);
      apiPigPenBatches.forEach((pigPenBatch) async {
        List<PigPen> pens = [];
        for (int i = 0; i < pigPenBatch.length; i++) {
          final apiPen = pigPenBatch[i];
          // check if pen exists
          /* TODO data */
          PigPen? pen =
              await db.pigPens.filter().uuidEqualTo(apiPen['uuid']).findFirst();

          bool isPenExists = pen != null;

          pen ??= PigPen()
            ..farmID = farmID
            ..userOwner = apiPen['userOwner']
            ..uuid = apiPen['uuid']
            ..penType = apiPen['penType']
            ..maxPigCount = apiPen['maxPigCount']
            ..currentPigCount = apiPen['currentPigCount']
            ..penNumber = apiPen['penNumber']
            ..createdAt = DateTime.parse(apiPen['createdAt'])
            ..updatedAt = DateTime.parse(apiPen['updatedAt']);

          if (isPenExists &&
              pen.updatedAt.isBefore(DateTime.parse(apiPen['updatedAt']))) {
            pen.penType = apiPen['penType'];
            pen.penNumber = apiPen['penNumber'];
            pen.currentPigCount = apiPen['currentPigCount'];
            pen.maxPigCount = apiPen['maxPigCount'];
            pen.updatedAt = DateTime.parse(apiPen['updatedAt']);
          }

          pens.add(pen);
        }
        if (pens.isNotEmpty) {
          await db.writeTxn(() async {
            db.pigPens.putAll(pens);
          });
        }
      });

      localUserMeta.lastSuccesfulReadSync = now;
      // merge to local isar db
      await db.writeTxn(() async {
        db.localUserMetas.put(localUserMeta!);
      });

      // get all pig pens from isar db greater than last sync date and less than now (to prevent uploading newly updated data from pull)
      var pigPensQuery = db.pigPens.filter().farmIDEqualTo(farmID);
      if (lastSyncWriteDate != null) {
        pigPensQuery = pigPensQuery.updatedAtGreaterThan(lastSyncWriteDate);
      }

      final pigPens = await pigPensQuery.findAll();
      // batch upload data to api
      final apiPigPenBatchesToUpload =
          PigHelper.splitArrayIntoBatches(pigPens, 10);
      apiPigPenBatchesToUpload.forEach((pigPenBatch) async {
        await PenApi.syncPen(farmID, pigPenBatch);
      });

      localUserMeta.lastSuccesfulWriteSync = now;
      await db.writeTxn(() async {
        db.localUserMetas.put(localUserMeta!);
      });
    } catch (e) {
      print(e);
      throw 'Something went wrong while sync pig pens';
    }
  }

/* SYNC PIGS */
  Future<void> syncPig(String farmID, String userOwner) async {
    try {
      final String model = 'pig';
      LocalUserMeta? localUserMeta = await db.localUserMetas
          .filter()
          .farmIDEqualTo(farmID)
          .modelEqualTo(model)
          .findFirst();

      localUserMeta ??= LocalUserMeta()
        ..farmID = farmID
        ..model = model
        ..lastSuccesfulReadSync = null
        ..lastSuccesfulWriteSync = null;

      final DateTime? lastSyncReadDate = localUserMeta.lastSuccesfulReadSync;
      final DateTime? lastSyncWriteDate = localUserMeta.lastSuccesfulWriteSync;
      final DateTime now = DateTime.now();

      // Get all pigs from API greater than local last sync date
      final List<dynamic> apiPigs =
          await PigApi.getSyncablePig(farmID, lastSyncReadDate);

      final apiPigBatches = PigHelper.splitArrayIntoBatches(apiPigs, 10);
      apiPigBatches.forEach((pigBatch) async {
        List<Pig> pigs = [];
        for (int i = 0; i < pigBatch.length; i++) {
          final apiPig = pigBatch[i];
          // Check if pig exists in local DB
          Pig? pig =
              await db.pigs.filter().uuidEqualTo(apiPig['uuid']).findFirst();

          bool isPigExists = pig != null;

          pig ??= Pig()
            ..farmID = farmID
            ..userOwner = apiPig['userOwner']
            ..uuid = apiPig['uuid']
            ..pigNumber = apiPig['pigNumber']
            ..dob = apiPig['dob']
            ..sex = apiPig['sex']
            ..status = apiPig['status']
            ..weightKG = apiPig['weightKG']
            ..lastWeightRecorded = apiPig['lastWeightRecorded']
            ..createdAt = DateTime.parse(apiPig['createdAt'])
            ..updatedAt = DateTime.parse(apiPig['updatedAt']);

          if (isPigExists &&
              pig.updatedAt.isBefore(DateTime.parse(apiPig['updatedAt']))) {
            pig.pigNumber = apiPig['pigNumber'];
            pig.dob = apiPig['dob'];
            pig.sex = apiPig['sex'];
            pig.status = apiPig['status'];
            pig.weightKG = apiPig['weightKG'];
            pig.lastWeightRecorded = apiPig['lastWeightRecorded'];
            pig.updatedAt = DateTime.parse(apiPig['updatedAt']);
          }

          pigs.add(pig);
        }
        if (pigs.isNotEmpty) {
          await db.writeTxn(() async {
            db.pigs.putAll(pigs);
          });
        }
      });

      localUserMeta.lastSuccesfulReadSync = now;
      await db.writeTxn(() async {
        db.localUserMetas.put(localUserMeta!);
      });

      // Get all pigs from local DB greater than last sync date and less than now (to prevent uploading newly updated data from pull)
      var pigQuery = db.pigs.filter().farmIDEqualTo(farmID);
      if (lastSyncWriteDate != null) {
        pigQuery = pigQuery.updatedAtGreaterThan(lastSyncWriteDate);
      }

      final pigs = await pigQuery.findAll();

      final apiPigBatchesToUpload = PigHelper.splitArrayIntoBatches(pigs, 10);
      apiPigBatchesToUpload.forEach((pigBatch) async {
        await PigApi.syncPig(farmID, pigBatch);
      });

      localUserMeta.lastSuccesfulWriteSync = now;
      await db.writeTxn(() async {
        db.localUserMetas.put(localUserMeta!);
      });
    } catch (e) {
      print(e);
      throw 'Something went wrong while syncing pigs';
    }
  }
}
