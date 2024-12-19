import 'dart:convert';

import 'package:pig_keep/Api/api.dart';
import 'package:pig_keep/Models/ledger.dart';

class LedgerApi {
  static getSyncableLedger(String farmID, DateTime? lastSyncDate) async {
    final queryParams = lastSyncDate != null
        ? '?last_successful_read_sync=${Uri.encodeComponent(lastSyncDate.toIso8601String())}'
        : '';

    final url = '/ledgers/syncable/$farmID$queryParams';
    return API.get(url);
  }

  static syncLedger(String farmID, List<Ledger> ledgers) async {
    final url = '/ledgers/syncable/$farmID';
    // format feeds to json
    List<Map<String, dynamic>> ledgersJSON = ledgers.map((ledger) {
      return {
        'farmID': ledger.farmID,
        'uuid': ledger.uuid,
        'pigUuid': ledger.pigUuid,
        'status': ledger.status,
        'transactionDate': ledger.transactionDate.toIso8601String(),
        'priceSold': ledger.priceSold,
        'weightKG': ledger.weightKG,
        'createdAt': ledger.createdAt.toIso8601String(),
        'updatedAt': ledger.updatedAt.toIso8601String(),
      };
    }).toList();
    return await API.post(url, {'ledgers': ledgersJSON});
  }
}
