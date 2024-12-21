import 'dart:convert';

import 'package:isar/isar.dart';
import 'package:pig_keep/Api/feed_api.dart';
import 'package:pig_keep/Api/feed_history_api.dart';
import 'package:pig_keep/Api/ledger_api.dart';
import 'package:pig_keep/Api/medicine_api.dart';
import 'package:pig_keep/Api/medicine_history_api.dart';
import 'package:pig_keep/Api/pen_api.dart';
import 'package:pig_keep/Api/pig_api.dart';
import 'package:pig_keep/Api/pig_event_api.dart';
import 'package:pig_keep/Models/feed-history.dart';
import 'package:pig_keep/Models/feed.dart';
import 'package:pig_keep/Models/ledger.dart';
import 'package:pig_keep/Models/local-user-meta.dart';
import 'package:pig_keep/Models/medicine-history.dart';
import 'package:pig_keep/Models/medicine.dart';
import 'package:pig_keep/Models/pig-event.dart';
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
    await syncFeeds(farmID, userOwner);
    await syncFeedsHistory(farmID, userOwner);
    await syncMedicines(farmID, userOwner);
    await syncMedicinesHistory(farmID, userOwner);
    await syncPigEvent(farmID, userOwner);
    await syncLedger(farmID, userOwner);
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

      for (var pigPenBatch in apiPigPenBatches) {
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
            await db.pigPens.putAll(pens);
          });
        }
      }

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

      for (var pigPenBatch in apiPigPenBatchesToUpload) {
        await PenApi.syncPen(farmID, pigPenBatch);
      }

      localUserMeta.lastSuccesfulWriteSync = now;
      await db.writeTxn(() async {
        await db.localUserMetas.put(localUserMeta!);
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

      for (var pigBatch in apiPigBatches) {
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
            ..penUuid = apiPig['penUuid']
            ..uuid = apiPig['uuid']
            ..pigNumber = apiPig['pigNumber']
            ..dob = DateTime.parse(apiPig['dob'])
            ..sex = apiPig['sex']
            ..status = apiPig['status']
            ..weightKG = apiPig['weightKG']?.toDouble()
            ..parentUuid = apiPig['parentUuid']
            ..lastWeightRecorded = apiPig['lastWeightRecorded'] != null
                ? DateTime.tryParse(apiPig['lastWeightRecorded'])
                : null
            ..createdAt = DateTime.parse(apiPig['createdAt'])
            ..updatedAt = DateTime.parse(apiPig['updatedAt']);

          if (isPigExists &&
              pig.updatedAt.isBefore(DateTime.parse(apiPig['updatedAt']))) {
            pig.penUuid = apiPig['penUuid'];
            pig.pigNumber = apiPig['pigNumber'];
            pig.dob = DateTime.parse(apiPig['dob']);
            pig.sex = apiPig['sex'];
            pig.parentUuid = apiPig['parentUuid'];
            pig.status = apiPig['status'];
            pig.weightKG = apiPig['weightKG']?.toDouble();
            pig.lastWeightRecorded = apiPig['lastWeightRecorded'] != null
                ? DateTime.tryParse(apiPig['lastWeightRecorded'])
                : null;
            pig.updatedAt = DateTime.parse(apiPig['updatedAt']);
          }

          pigs.add(pig);
        }
        if (pigs.isNotEmpty) {
          await db.writeTxn(() async {
            await db.pigs.putAll(pigs);
          });
        }
      }

      localUserMeta.lastSuccesfulReadSync = now;
      await db.writeTxn(() async {
        await db.localUserMetas.put(localUserMeta!);
      });

      // Get all pigs from local DB greater than last sync date and less than now (to prevent uploading newly updated data from pull)
      var pigQuery = db.pigs.filter().farmIDEqualTo(farmID);
      if (lastSyncWriteDate != null) {
        pigQuery = pigQuery.updatedAtGreaterThan(lastSyncWriteDate);
        print('WEEEW');
      }

      final pigs = await pigQuery.findAll();

      print('PIG LENGTH');
      print(farmID);
      print(lastSyncWriteDate);
      for (var pig in pigs) {
        print(pig.pigNumber);
        print(pig.status);
        print(pig.updatedAt);
      }

      final apiPigBatchesToUpload = PigHelper.splitArrayIntoBatches(pigs, 10);
      for (var pigBatch in apiPigBatchesToUpload) {
        await PigApi.syncPig(farmID, pigBatch);
      }

      localUserMeta.lastSuccesfulWriteSync = now;
      await db.writeTxn(() async {
        await db.localUserMetas.put(localUserMeta!);
      });
    } catch (e) {
      print(e);
      throw 'Something went wrong while syncing pigs';
    }
  }

  /* SYNC FEEDS */
  Future<void> syncFeeds(String farmID, String userOwner) async {
    try {
      final String model = 'feed';
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
      final List<dynamic> apiFeeds =
          await FeedApi.getSyncableFeed(farmID, lastSyncReadDate);

      final apiFeedBatches = PigHelper.splitArrayIntoBatches(apiFeeds, 10);

      for (var feedBatch in apiFeedBatches) {
        List<Feed> feeds = [];
        for (int i = 0; i < feedBatch.length; i++) {
          final apiFeed = feedBatch[i];
          // Check if pig exists in local DB
          Feed? feed =
              await db.feeds.filter().uuidEqualTo(apiFeed['uuid']).findFirst();

          bool isFeedExists = feed != null;

          feed ??= Feed()
            ..farmID = apiFeed['farmID']
            ..uuid = apiFeed['uuid']
            ..weightKG = apiFeed['weightKG']?.toDouble()
            ..cost = apiFeed['cost']?.toDouble()
            ..feedType = apiFeed['feedType']
            ..createdAt = DateTime.parse(apiFeed['createdAt'])
            ..updatedAt = DateTime.parse(apiFeed['updatedAt']);

          if (isFeedExists &&
              feed.updatedAt.isBefore(DateTime.parse(apiFeed['updatedAt']))) {
            feed.weightKG = apiFeed['weightKG']?.toDouble();
            feed.cost = apiFeed['cost']?.toDouble();
            feed.feedType = apiFeed['feedType'];
            feed.updatedAt = DateTime.parse(apiFeed['updatedAt']);
          }

          feeds.add(feed);
        }
        if (feeds.isNotEmpty) {
          await db.writeTxn(() async {
            await db.feeds.putAll(feeds);
          });
        }
      }

      localUserMeta.lastSuccesfulReadSync = now;
      await db.writeTxn(() async {
        await db.localUserMetas.put(localUserMeta!);
      });

      // Get all feeds from local DB greater than last sync date and less than now (to prevent uploading newly updated data from pull)
      var feedQuery = db.feeds.filter().farmIDEqualTo(farmID);
      if (lastSyncWriteDate != null) {
        feedQuery = feedQuery.updatedAtGreaterThan(lastSyncWriteDate);
      }

      final feeds = await feedQuery.findAll();

      final apiFeedBatchesToUpload = PigHelper.splitArrayIntoBatches(feeds, 10);
      for (var feedBatch in apiFeedBatchesToUpload) {
        await FeedApi.syncFeed(farmID, feedBatch);
      }

      localUserMeta.lastSuccesfulWriteSync = now;
      await db.writeTxn(() async {
        await db.localUserMetas.put(localUserMeta!);
      });
    } catch (e) {
      print(e);
      throw 'Something went wrong while syncing feeds';
    }
  }

  /* SYNC FEEDS HISTORY */
  Future<void> syncFeedsHistory(String farmID, String userOwner) async {
    try {
      final String model = 'feedHistory';
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
      final List<dynamic> apiFeedsHistory =
          await FeedHistoryApi.getSyncableFeedHistory(farmID, lastSyncReadDate);

      final apiFeedHistoryBatches =
          PigHelper.splitArrayIntoBatches(apiFeedsHistory, 10);

      for (var feedHistoryBatch in apiFeedHistoryBatches) {
        List<FeedHistory> feedsHistory = [];
        for (int i = 0; i < feedHistoryBatch.length; i++) {
          final apiFeedHistory = feedHistoryBatch[i];
          // Check if pig exists in local DB
          FeedHistory? feedHistory = await db.feedHistorys
              .filter()
              .uuidEqualTo(apiFeedHistory['uuid'])
              .findFirst();

          bool isFeedHistoryExists = feedHistory != null;

          feedHistory ??= FeedHistory()
            ..farmID = apiFeedHistory['farmID']
            ..uuid = apiFeedHistory['uuid']
            ..weightKG = apiFeedHistory['weightKG']?.toDouble()
            ..cost = apiFeedHistory['cost']?.toDouble()
            ..feedType = apiFeedHistory['feedType']
            ..status = apiFeedHistory['status']
            ..createdAt = DateTime.parse(apiFeedHistory['createdAt'])
            ..updatedAt = DateTime.parse(apiFeedHistory['updatedAt']);

          if (isFeedHistoryExists &&
              feedHistory.updatedAt
                  .isBefore(DateTime.parse(apiFeedHistory['updatedAt']))) {
            feedHistory.weightKG = apiFeedHistory['weightKG']?.toDouble();
            feedHistory.cost = apiFeedHistory['cost']?.toDouble();
            feedHistory.feedType = apiFeedHistory['feedType'];
            feedHistory.status = apiFeedHistory['status'];
            feedHistory.updatedAt = DateTime.parse(apiFeedHistory['updatedAt']);
          }

          feedsHistory.add(feedHistory);
        }
        if (feedsHistory.isNotEmpty) {
          await db.writeTxn(() async {
            await db.feedHistorys.putAll(feedsHistory);
          });
        }
      }

      localUserMeta.lastSuccesfulReadSync = now;
      await db.writeTxn(() async {
        await db.localUserMetas.put(localUserMeta!);
      });

      // Get all pigs from local DB greater than last sync date and less than now (to prevent uploading newly updated data from pull)
      var feedHistoryQuery = db.feedHistorys.filter().farmIDEqualTo(farmID);
      if (lastSyncWriteDate != null) {
        feedHistoryQuery =
            feedHistoryQuery.updatedAtGreaterThan(lastSyncWriteDate);
      }

      final feedsHistory = await feedHistoryQuery.findAll();

      final apiFeedHistoryBatchesToUpload =
          PigHelper.splitArrayIntoBatches(feedsHistory, 10);
      for (var feedHistoryBatch in apiFeedHistoryBatchesToUpload) {
        await FeedHistoryApi.syncFeedHistory(farmID, feedHistoryBatch);
      }

      localUserMeta.lastSuccesfulWriteSync = now;
      await db.writeTxn(() async {
        await db.localUserMetas.put(localUserMeta!);
      });
    } catch (e) {
      print(e);
      throw 'Something went wrong while syncing feeds history';
    }
  }

  /* SYNC MEDICINE */
  Future<void> syncMedicines(String farmID, String userOwner) async {
    try {
      final String model = 'medicine';
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

      // Get all meds from API greater than local last sync date
      final List<dynamic> apiMedicines =
          await MedicineApi.getSyncableMedicine(farmID, lastSyncReadDate);

      final apiMedicineBatches =
          PigHelper.splitArrayIntoBatches(apiMedicines, 10);

      for (var medicineBatch in apiMedicineBatches) {
        List<Medicine> medicines = [];
        for (int i = 0; i < medicineBatch.length; i++) {
          final apiMedicine = medicineBatch[i];
          // Check if med exists in local DB
          Medicine? medicine = await db.medicines
              .filter()
              .uuidEqualTo(apiMedicine['uuid'])
              .findFirst();

          bool isMedicineExists = medicine != null;

          medicine ??= Medicine()
            ..farmID = apiMedicine['farmID']
            ..uuid = apiMedicine['uuid']
            ..medicineName = apiMedicine['medicineName']
            ..dosage = apiMedicine['dosage']
            ..description = apiMedicine['description']
            ..quantity = apiMedicine['quantity']
            ..avgCost = apiMedicine['avgCost']?.toDouble()
            ..createdAt = DateTime.parse(apiMedicine['createdAt'])
            ..updatedAt = DateTime.parse(apiMedicine['updatedAt']);

          if (isMedicineExists &&
              medicine.updatedAt
                  .isBefore(DateTime.parse(apiMedicine['updatedAt']))) {
            medicine.medicineName = apiMedicine['medicineName'];
            medicine.dosage = apiMedicine['dosage'];
            medicine.description = apiMedicine['description'];
            medicine.quantity = apiMedicine['quantity'];
            medicine.avgCost = apiMedicine['avgCost']?.toDouble();
            medicine.updatedAt = DateTime.parse(apiMedicine['updatedAt']);
          }

          medicines.add(medicine);
        }
        if (medicines.isNotEmpty) {
          await db.writeTxn(() async {
            await db.medicines.putAll(medicines);
          });
        }
      }

      localUserMeta.lastSuccesfulReadSync = now;
      await db.writeTxn(() async {
        await db.localUserMetas.put(localUserMeta!);
      });

      // Get all pigs from local DB greater than last sync date and less than now (to prevent uploading newly updated data from pull)
      var medicineQuery = db.medicines.filter().farmIDEqualTo(farmID);
      if (lastSyncWriteDate != null) {
        medicineQuery = medicineQuery.updatedAtGreaterThan(lastSyncWriteDate);
      }

      final medicines = await medicineQuery.findAll();

      final apiMedicineBatchesToUpload =
          PigHelper.splitArrayIntoBatches(medicines, 10);
      for (var medicineBatch in apiMedicineBatchesToUpload) {
        await MedicineApi.syncMedicine(farmID, medicineBatch);
      }

      localUserMeta.lastSuccesfulWriteSync = now;
      await db.writeTxn(() async {
        await db.localUserMetas.put(localUserMeta!);
      });
    } catch (e) {
      print(e);
      throw 'Something went wrong while syncing medicines';
    }
  }

  /* SYNC MEDICINE HISTORY*/
  Future<void> syncMedicinesHistory(String farmID, String userOwner) async {
    try {
      final String model = 'medicineHistory';
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
      final List<dynamic> apiMedicinesHistory =
          await MedicineHistoryApi.getSyncableMedicineHistory(
              farmID, lastSyncReadDate);

      final apiMedicineHistoryBatches =
          PigHelper.splitArrayIntoBatches(apiMedicinesHistory, 10);

      for (var medicineHistoryBatch in apiMedicineHistoryBatches) {
        List<MedicineHistory> medicinesHistory = [];
        for (int i = 0; i < medicineHistoryBatch.length; i++) {
          final apiMedicineHistory = medicineHistoryBatch[i];
          // Check if pig exists in local DB
          MedicineHistory? medicineHistory = await db.medicineHistorys
              .filter()
              .uuidEqualTo(apiMedicineHistory['uuid'])
              .findFirst();

          bool isMedicineHistoryExists = medicineHistory != null;

          medicineHistory ??= MedicineHistory()
            ..farmID = apiMedicineHistory['farmID']
            ..uuid = apiMedicineHistory['uuid']
            ..medicineName = apiMedicineHistory['medicineName']
            ..dosage = apiMedicineHistory['dosage']
            ..quantity = apiMedicineHistory['quantity']
            ..cost = apiMedicineHistory['cost']?.toDouble()
            ..status = apiMedicineHistory['status']
            ..createdAt = DateTime.parse(apiMedicineHistory['createdAt'])
            ..updatedAt = DateTime.parse(apiMedicineHistory['updatedAt']);

          if (isMedicineHistoryExists &&
              medicineHistory.updatedAt
                  .isBefore(DateTime.parse(apiMedicineHistory['updatedAt']))) {
            medicineHistory.medicineName = apiMedicineHistory['medicineName'];
            medicineHistory.dosage = apiMedicineHistory['dosage'];
            medicineHistory.quantity = apiMedicineHistory['quantity'];
            medicineHistory.cost = apiMedicineHistory['cost']?.toDouble();
            medicineHistory.updatedAt =
                DateTime.parse(apiMedicineHistory['updatedAt']);
          }

          medicinesHistory.add(medicineHistory);
        }
        if (medicinesHistory.isNotEmpty) {
          await db.writeTxn(() async {
            await db.medicineHistorys.putAll(medicinesHistory);
          });
        }
      }

      localUserMeta.lastSuccesfulReadSync = now;
      await db.writeTxn(() async {
        await db.localUserMetas.put(localUserMeta!);
      });

      // Get all pigs from local DB greater than last sync date and less than now (to prevent uploading newly updated data from pull)
      var medicineHistoryQuery =
          db.medicineHistorys.filter().farmIDEqualTo(farmID);
      if (lastSyncWriteDate != null) {
        medicineHistoryQuery =
            medicineHistoryQuery.updatedAtGreaterThan(lastSyncWriteDate);
      }

      final medicinesHistory = await medicineHistoryQuery.findAll();

      final apiMedicineHistoryBatchesToUpload =
          PigHelper.splitArrayIntoBatches(medicinesHistory, 10);
      for (var medicineHistoryBatch in apiMedicineHistoryBatchesToUpload) {
        await MedicineHistoryApi.syncMedicineHistory(
            farmID, medicineHistoryBatch);
      }

      localUserMeta.lastSuccesfulWriteSync = now;
      await db.writeTxn(() async {
        await db.localUserMetas.put(localUserMeta!);
      });
    } catch (e) {
      print(e);
      throw 'Something went wrong while syncing medicine history';
    }
  }

  /* SYNC EVENTS*/
  Future<void> syncPigEvent(String farmID, String userOwner) async {
    try {
      final String model = 'pigEvent';
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
      final List<dynamic> apiPigEvents =
          await PigEventApi.getSyncablePigEvent(farmID, lastSyncReadDate);

      final apiPigEventBatches =
          PigHelper.splitArrayIntoBatches(apiPigEvents, 10);

      for (var pigEventBatch in apiPigEventBatches) {
        List<PigEvent> pigEvents = [];
        for (int i = 0; i < pigEventBatch.length; i++) {
          final apiPigEvent = pigEventBatch[i];
          // Check if pig exists in local DB
          PigEvent? pigEvent = await db.pigEvents
              .filter()
              .uuidEqualTo(apiPigEvent['uuid'])
              .findFirst();

          bool isPigEventExists = pigEvent != null;

          pigEvent ??= PigEvent()
            ..farmID = apiPigEvent['farmID']
            ..uuid = apiPigEvent['uuid']
            ..pigUuid = apiPigEvent['pigUuid']
            ..status = apiPigEvent['status']
            ..pigNumber = apiPigEvent['pigNumber']
            ..eventType = apiPigEvent['eventType']
            ..eventDate = DateTime.parse(apiPigEvent['eventDate'])
            ..createdAt = DateTime.parse(apiPigEvent['createdAt'])
            ..updatedAt = DateTime.parse(apiPigEvent['updatedAt']);

          if (isPigEventExists &&
              pigEvent.updatedAt
                  .isBefore(DateTime.parse(apiPigEvent['updatedAt']))) {
            pigEvent.pigUuid = apiPigEvent['pigUuid'];
            pigEvent.status = apiPigEvent['status'];
            pigEvent.pigNumber = apiPigEvent['pigNumber'];
            pigEvent.eventType = apiPigEvent['eventType'];
            pigEvent.eventDate = DateTime.parse(apiPigEvent['eventDate']);
            pigEvent.updatedAt = DateTime.parse(apiPigEvent['updatedAt']);
          }

          pigEvents.add(pigEvent);
        }
        if (pigEvents.isNotEmpty) {
          await db.writeTxn(() async {
            await db.pigEvents.putAll(pigEvents);
          });
        }
      }

      localUserMeta.lastSuccesfulReadSync = now;
      await db.writeTxn(() async {
        await db.localUserMetas.put(localUserMeta!);
      });

      // Get all pigs from local DB greater than last sync date and less than now (to prevent uploading newly updated data from pull)
      var pigEventQuery = db.pigEvents.filter().farmIDEqualTo(farmID);
      if (lastSyncWriteDate != null) {
        pigEventQuery = pigEventQuery.updatedAtGreaterThan(lastSyncWriteDate);
      }

      final pigEvents = await pigEventQuery.findAll();

      final apiPigEventBatchesToUpload =
          PigHelper.splitArrayIntoBatches(pigEvents, 10);
      for (var pigEventBatch in apiPigEventBatchesToUpload) {
        await PigEventApi.syncPigEvent(farmID, pigEventBatch);
      }

      localUserMeta.lastSuccesfulWriteSync = now;
      await db.writeTxn(() async {
        await db.localUserMetas.put(localUserMeta!);
      });
    } catch (e) {
      print(e);
      throw 'Something went wrong while syncing events';
    }
  }

  /* SYNC LEDGER*/
  Future<void> syncLedger(String farmID, String userOwner) async {
    try {
      final String model = 'ledger';
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
      final List<dynamic> apiLedgers =
          await LedgerApi.getSyncableLedger(farmID, lastSyncReadDate);

      final apiLedgerBatches = PigHelper.splitArrayIntoBatches(apiLedgers, 10);

      for (var ledgerBatch in apiLedgerBatches) {
        List<Ledger> ledgers = [];
        for (int i = 0; i < ledgerBatch.length; i++) {
          final apiLedger = ledgerBatch[i];
          // Check if pig exists in local DB
          Ledger? ledger = await db.ledgers
              .filter()
              .uuidEqualTo(apiLedger['uuid'])
              .findFirst();

          bool isLedgerExists = ledger != null;

          ledger ??= Ledger()
            ..farmID = apiLedger['farmID']
            ..userOwner = apiLedger['userOwner']
            ..uuid = apiLedger['uuid']
            ..pigUuid = apiLedger['pigUuid']
            ..status = apiLedger['status']
            ..transactionDate = DateTime.parse(apiLedger['transactionDate'])
            ..priceSold = apiLedger['priceSold']?.toDouble()
            ..weightKG = apiLedger['weightKG']?.toDouble()
            ..createdAt = DateTime.parse(apiLedger['createdAt'])
            ..updatedAt = DateTime.parse(apiLedger['updatedAt']);

          if (isLedgerExists &&
              ledger.updatedAt
                  .isBefore(DateTime.parse(apiLedger['updatedAt']))) {
            ledger.pigUuid = apiLedger['pigUuid'];
            ledger.status = apiLedger['status'];
            ledger.transactionDate =
                DateTime.parse(apiLedger['transactionDate']);
            ledger.priceSold = apiLedger['priceSold']?.toDouble();
            ledger.weightKG = apiLedger['weightKG']?.toDouble();
            ledger.updatedAt = DateTime.parse(apiLedger['updatedAt']);
          }

          ledgers.add(ledger);
        }
        if (ledgers.isNotEmpty) {
          await db.writeTxn(() async {
            await db.ledgers.putAll(ledgers);
          });
        }
      }

      localUserMeta.lastSuccesfulReadSync = now;
      await db.writeTxn(() async {
        await db.localUserMetas.put(localUserMeta!);
      });

      // Get all pigs from local DB greater than last sync date and less than now (to prevent uploading newly updated data from pull)
      var ledgerQuery = db.ledgers.filter().farmIDEqualTo(farmID);
      if (lastSyncWriteDate != null) {
        ledgerQuery = ledgerQuery.updatedAtGreaterThan(lastSyncWriteDate);
      }

      final ledgers = await ledgerQuery.findAll();

      final apiLedgerBatchesToUpload =
          PigHelper.splitArrayIntoBatches(ledgers, 10);
      for (var ledgerBatch in apiLedgerBatchesToUpload) {
        await LedgerApi.syncLedger(farmID, ledgerBatch);
      }

      localUserMeta.lastSuccesfulWriteSync = now;
      await db.writeTxn(() async {
        await db.localUserMetas.put(localUserMeta!);
      });
    } catch (e) {
      print(e);
      throw 'Something went wrong while syncing ledger';
    }
  }
}
