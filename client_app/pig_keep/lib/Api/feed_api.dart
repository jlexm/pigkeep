import 'dart:convert';

import 'package:pig_keep/Api/api.dart';
import 'package:pig_keep/Models/feed.dart';

class FeedApi {
  static getSyncableFeed(String farmID, DateTime? lastSyncDate) async {
    final queryParams = lastSyncDate != null
        ? '?last_successful_read_sync=${Uri.encodeComponent(lastSyncDate.toIso8601String())}'
        : '';

    final url = '/feeds/syncable/$farmID$queryParams';
    return API.get(url);
  }

  static syncFeed(String farmID, List<Feed> feeds) async {
    final url = '/feeds/syncable/$farmID';
    // format feeds to json
    List<Map<String, dynamic>> feedsJSON = feeds.map((feed) {
      return {
        'farmID': feed.farmID,
        'feedType': feed.feedType,
        'uuid': feed.uuid,
        'weightKG': feed.weightKG,
        'cost': feed.cost,
        'createdAt': feed.createdAt.toIso8601String(),
        'updatedAt': feed.updatedAt.toIso8601String(),
      };
    }).toList();
    return await API.post(url, {'feeds': feedsJSON});
  }
}
