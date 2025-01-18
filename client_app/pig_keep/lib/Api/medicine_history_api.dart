import 'dart:convert';

import 'package:pig_keep/Api/api.dart';
import 'package:pig_keep/Models/medicine-history.dart';

class MedicineHistoryApi {
  static getSyncableMedicineHistory(
      String farmID, DateTime? lastSyncDate) async {
    final queryParams = lastSyncDate != null
        ? '?last_successful_read_sync=${Uri.encodeComponent(lastSyncDate.toIso8601String())}'
        : '';

    final url = '/medicine-history/syncable/$farmID$queryParams';
    return API.get(url);
  }

  static syncMedicineHistory(
      String farmID, List<MedicineHistory> medicinesHistory) async {
    final url = '/medicine-history/syncable/$farmID';
    // format feeds to json
    List<Map<String, dynamic>> medicinesHistoryJSON =
        medicinesHistory.map((medicineHistory) {
      return {
        'farmID': medicineHistory.farmID,
        'uuid': medicineHistory.uuid,
        'medicineName': medicineHistory.medicineName,
        'pigUuid': medicineHistory.pigUuid,
        'dosage': medicineHistory.dosage,
        'quantity': medicineHistory.quantity,
        'cost': medicineHistory.cost,
        'status': medicineHistory.status,
        'createdAt': medicineHistory.createdAt.toIso8601String(),
        'updatedAt': medicineHistory.updatedAt.toIso8601String(),
      };
    }).toList();
    return await API.post(url, {'medicinesHistory': medicinesHistoryJSON});
  }
}
