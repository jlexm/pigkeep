import 'dart:convert';

import 'package:pig_keep/Api/api.dart';
import 'package:pig_keep/Models/pig-event.dart';

class PigEventApi {
  static getSyncablePigEvent(String farmID, DateTime? lastSyncDate) async {
    final queryParams = lastSyncDate != null
        ? '?last_successful_read_sync=${Uri.encodeComponent(lastSyncDate.toIso8601String())}'
        : '';

    final url = '/pig-event/syncable/$farmID$queryParams';
    return API.get(url);
  }

  static syncPigEvent(String farmID, List<PigEvent> pigEvents) async {
    final url = '/pig-event/syncable/$farmID';
    // format feeds to json
    List<Map<String, dynamic>> pigEventsJSON = pigEvents.map((pigEvent) {
      return {
        'farmID': pigEvent.farmID,
        'uuid': pigEvent.uuid,
        'pigUuid': pigEvent.pigUuid,
        'status': pigEvent.status,
        'pigNumber': pigEvent.pigNumber,
        'eventType': pigEvent.eventType,
        'eventDate': pigEvent.eventDate.toIso8601String(),
        'createdAt': pigEvent.createdAt.toIso8601String(),
        'updatedAt': pigEvent.updatedAt.toIso8601String(),
      };
    }).toList();
    return await API.post(url, {'pigEvents': pigEventsJSON});
  }
}
