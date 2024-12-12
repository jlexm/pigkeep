import 'dart:convert';

import 'package:pig_keep/Api/api.dart';
import 'package:pig_keep/Models/pig.dart';

class PigApi {
  static getSyncablePig(String farmID, DateTime? lastSyncDate) async {
    final queryParams = lastSyncDate != null
        ? '?last_successful_read_sync=${Uri.encodeComponent(lastSyncDate.toIso8601String())}'
        : '';

    final url = '/pigs/syncable/$farmID$queryParams';
    return API.get(url);
  }

  static syncPig(String farmID, List<Pig> pigs) async {
    final url = '/pigs/syncable/$farmID';
    // format pigs to json
    List<Map<String, dynamic>> pigsJSON = pigs.map((pig) {
      return {
        'userOwner': pig.userOwner,
        'penUuid': pig.penUuid,
        'pigNumber': pig.pigNumber,
        'farmID': pig.farmID,
        'parentUuid': pig.parentUuid,
        'uuid': pig.uuid,
        'dob': pig.dob.toIso8601String(),
        'sex': pig.sex,
        'status': pig.status,
        'weightKG': pig.weightKG,
        'lastWeightRecorded': pig.lastWeightRecorded?.toIso8601String(),
        'createdAt': pig.createdAt.toIso8601String(),
        'updatedAt': pig.updatedAt.toIso8601String(),
      };
    }).toList();
    return await API.post(url, {'pigs': pigsJSON});
  }
}
