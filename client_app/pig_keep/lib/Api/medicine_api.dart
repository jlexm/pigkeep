import 'dart:convert';

import 'package:pig_keep/Api/api.dart';
import 'package:pig_keep/Models/medicine.dart';

class MedicineApi {
  static getSyncableMedicine(String farmID, DateTime? lastSyncDate) async {
    final queryParams = lastSyncDate != null
        ? '?last_successful_read_sync=${Uri.encodeComponent(lastSyncDate.toIso8601String())}'
        : '';

    final url = '/medicines/syncable/$farmID$queryParams';
    return API.get(url);
  }

  static syncMedicine(String farmID, List<Medicine> medicines) async {
    final url = '/medicines/syncable/$farmID';
    // format feeds to json
    List<Map<String, dynamic>> medicinesJSON = medicines.map((medicine) {
      return {
        'farmID': medicine.farmID,
        'uuid': medicine.uuid,
        'medicineName': medicine.medicineName,
        'dosage': medicine.dosage,
        'description': medicine.description,
        'quantity': medicine.quantity,
        'avgCost': medicine.avgCost,
        'createdAt': medicine.createdAt.toIso8601String(),
        'updatedAt': medicine.updatedAt.toIso8601String(),
      };
    }).toList();
    return await API.post(url, {'medicines': medicinesJSON});
  }
}
