import 'dart:convert';

import 'package:isar/isar.dart';
import 'package:pig_keep/Models/pig-event.dart';
import 'package:pig_keep/Models/pig.dart';
import 'package:pig_keep/Services/database-service.dart';
import 'package:pig_keep/Services/medicine-service.dart';
import 'package:pig_keep/Services/pig-helper.dart';
import 'package:pig_keep/Services/toast-service.dart';
import 'package:pig_keep/main.dart';

class PigEventService {
  Isar db = globalLocator.get<DatabaseService>().db;

  Future<void> addNewEvent(String farmID, DateTime eventDate, String pigUuid,
      String eventType, String status) async {
    if (eventType == '') {
      throw 'Event type is required';
    }
    // set event time to 12:00 AM
    eventDate = PigHelper.setToMidnight(eventDate);

    // check if event already exists
    PigEvent? prevEvent = await db.pigEvents
        .filter()
        .farmIDEqualTo(farmID)
        .eventDateEqualTo(eventDate)
        .pigUuidEqualTo(pigUuid)
        .eventTypeEqualTo(eventType)
        .not()
        .statusEqualTo('Completed')
        .findFirst();

    if (prevEvent != null) {
      throw 'Pig Event already exists';
    }

    Pig? pig = await db.pigs.filter().uuidEqualTo(pigUuid).findFirst();
    if (pig == null) {
      throw 'Pig not found';
    }

    PigEvent pigEvent = PigEvent()
      ..farmID = farmID
      ..eventDate = eventDate
      ..pigUuid = pigUuid
      ..eventType = eventType
      ..status = status
      ..pigNumber = pig.pigNumber;

    await db.writeTxn(() async {
      await db.pigEvents.put(pigEvent);
    });
  }

  Future<void> markEventAsCompleted(String eventUuid) async {
    PigEvent? pigEvent =
        await db.pigEvents.filter().uuidEqualTo(eventUuid).findFirst();
    if (pigEvent == null) {
      throw 'Event not found!';
    }

    if (pigEvent.status == 'Completed') {
      throw 'Event already completed';
    }

    pigEvent.status = 'Completed';
    pigEvent.updatedAt = DateTime.now();

    await db.writeTxn(() async {
      await db.pigEvents.put(pigEvent);
    });
  }

  Future<void> updateEvent(String eventUuid, DateTime eventDate, String pigUuid,
      String eventType) async {
    PigEvent? pigEvent =
        await db.pigEvents.filter().uuidEqualTo(eventUuid).findFirst();
    if (pigEvent == null) {
      throw 'Event not found!';
    }

    Pig? pig = await db.pigs.filter().uuidEqualTo(pigUuid).findFirst();
    if (pig == null) {
      throw 'Pig not found';
    }

    pigEvent.eventDate = eventDate;
    pigEvent.pigUuid = pigUuid;
    pigEvent.pigNumber = pig.pigNumber;
    pigEvent.eventType = eventType;
    pigEvent.status = 'Pending';
    pigEvent.updatedAt = DateTime.now();

    await db.writeTxn(() async {
      await db.pigEvents.put(pigEvent);
    });
  }

  Future<List<PigEvent>> getUpcomingEvents(String farmID) async {
    // starts at 12:00am of current date
    DateTime startOfDay =
        PigHelper.setToMidnight(DateTime.now().add(Duration(days: 1)));
    return await db.pigEvents
        .filter()
        .farmIDEqualTo(farmID)
        .group((q) => q
            .eventDateGreaterThan(startOfDay)
            .or()
            .eventDateEqualTo(startOfDay))
        .not()
        .statusEqualTo('Completed')
        .not()
        .statusEqualTo('Deleted')
        .findAll();
  }

  Future<List<PigEvent>> getWIPEvents(String farmID) async {
    // starts at 12:00am of current date
    DateTime startOfDay =
        PigHelper.setToMidnight(DateTime.now().add(Duration(days: 1)));
    return await db.pigEvents
        .filter()
        .farmIDEqualTo(farmID)
        .eventDateLessThan(startOfDay)
        .not()
        .statusEqualTo('Completed')
        .not()
        .statusEqualTo('Deleted')
        .findAll();
  }

  // month starts with 1 (january) and ends with 12 (december)
  Future<List<PigEvent>> getMonthlyEvents(
      String farmID, int month, int year) async {
    DateTime startOfMonth = DateTime(year, month, 1, 0, 0, 0);
    DateTime endOfMonth = DateTime(year, month + 1, 1, 0, 0, 0)
        .subtract(const Duration(seconds: 1));

    return await db.pigEvents
        .filter()
        .farmIDEqualTo(farmID)
        .eventDateBetween(startOfMonth, endOfMonth)
        .not()
        .statusEqualTo('Deleted')
        .findAll();
  }

  Future<List<PigEvent>> getEventHistory(String farmID) async {
    return await db.pigEvents
        .filter()
        .farmIDEqualTo(farmID)
        .statusEqualTo('Completed')
        .findAll();
  }

  Future<List<PigEvent>> getEventNotification(String farmID) async {
    DateTime today = PigHelper.setToMidnight(DateTime.now());
    return await db.pigEvents
        .filter()
        .farmIDEqualTo(farmID)
        .not()
        .statusEqualTo('Completed')
        .not()
        .statusEqualTo('Deleted')
        .group(
            (q) => q.eventDateGreaterThan(today).or().eventDateEqualTo(today))
        .eventDateLessThan(today.add(Duration(days: 14)))
        .sortByEventDate()
        .findAll();
  }

  Future<void> deletePigEventSoft(String pigEventUuid) async {
    final pigEvent =
        await db.pigEvents.filter().uuidEqualTo(pigEventUuid).findFirst();
    if (pigEvent == null || pigEvent.status == 'Deleted') {
      ToastService().showErrorToast("Event does not exists or deleted.");
      throw 'Event does not exist or deleted.';
    }
    pigEvent.status = 'Deleted';
    pigEvent.updatedAt = DateTime.now();
    await db.writeTxn(() async {
      await db.pigEvents.put(pigEvent);
    });
    ToastService().showWarningToast("Event deleted.");
  }
}
