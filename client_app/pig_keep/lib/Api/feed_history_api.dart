import 'dart:convert';

import 'package:pig_keep/Api/api.dart';
import 'package:pig_keep/Models/feed-history.dart';
import 'package:pig_keep/Models/feed.dart';

class FeedHistoryApi {
  static getSyncableFeedHistory(String farmID, DateTime? lastSyncDate) async {
    final queryParams = lastSyncDate != null
        ? '?last_successful_read_sync=${Uri.encodeComponent(lastSyncDate.toIso8601String())}'
        : '';

    final url = '/feed-history/syncable/$farmID$queryParams';
    return API.get(url);
  }

  static syncFeedHistory(String farmID, List<FeedHistory> feedsHistory) async {
    final url = '/feed-history/syncable/$farmID';
    // format feedsHistory to json
    List<Map<String, dynamic>> feedsHistoryJSON =
        feedsHistory.map((feedHistory) {
      return {
        'farmID': feedHistory.farmID,
        'feedType': feedHistory.feedType,
        'uuid': feedHistory.uuid,
        'weightKG': feedHistory.weightKG,
        'cost': feedHistory.cost,
        'status': feedHistory.status,
        'createdAt': feedHistory.createdAt.toIso8601String(),
        'updatedAt': feedHistory.updatedAt.toIso8601String(),
      };
    }).toList();
    return await API.post(url, {'feedsHistory': feedsHistoryJSON});
  }
}
