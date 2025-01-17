import 'package:isar/isar.dart';
import 'package:pig_keep/Models/feed-history.dart';
import 'package:pig_keep/Models/feed.dart';
import 'package:pig_keep/Services/database-service.dart';
import 'package:pig_keep/main.dart';

class FeedService {
  Isar db = globalLocator.get<DatabaseService>().db;

  Future<void> addFeed(bool isEditMode, String farmID, String status,
      String feedType, double weightKG, double cost) async {
    if (weightKG <= 0) {
      throw 'Invalid Quantity Value';
    }
    if (cost < 0) {
      throw 'Invalid Cost Value';
    }

    // upsert feed type
    var feed = await db.feeds
        .filter()
        .feedTypeEqualTo(feedType)
        .farmIDEqualTo(farmID)
        .findFirst();
    if (feed == null) {
      if (status == 'consumed') {
        throw 'Cannot consume non existing feed type';
      }
      // perform insert feed
      feed = Feed()
        ..farmID = farmID
        ..feedType = feedType
        ..weightKG = weightKG
        ..cost = cost;
    } else {
      // perform update feed
      if (status == 'stock') {
        feed.cost = cost;
      }
      feed.weightKG += status == 'stock'
          ? weightKG
          : -weightKG; // if stock add, consume minus

      if (feed.weightKG < 0) {
        throw 'Not enough stock available';
      }
      feed.updatedAt = DateTime.now();
    }

    if (isEditMode) {
      feed.weightKG = weightKG;
      await db.writeTxn(() async {
        await db.feeds.put(feed!);
      });
    } else {
      // add feed history
      final feedHistory = FeedHistory()
        ..farmID = farmID
        ..cost = cost
        ..feedType = feedType
        ..weightKG = weightKG
        ..status = status;

      await db.writeTxn(() async {
        await db.feeds.put(feed!);
        await db.feedHistorys.put(feedHistory);
      });
    }
  }

  Future<List<Feed>> getFeeds(String farmID) async {
    return await db.feeds.filter().farmIDEqualTo(farmID).findAll();
  }

  Future<List<FeedHistory>> getFeedsTransactions(String farmID) async {
    final feedH = await db.feedHistorys
        .filter()
        .farmIDEqualTo(farmID)
        .sortByCreatedAtDesc()
        .limit(20)
        .findAll();
    return feedH;
  }

  Future<void> updateFeed(
      String uuid, String feedType, double weightKG, double cost) async {
    Feed? feed = await db.feeds.filter().uuidEqualTo(uuid).findFirst();

    if (feed == null) {
      throw 'Feed not found.';
    }
    if (feedType == '') {
      throw 'Invalid feed type';
    }
    if (weightKG < 1) {
      throw 'Invalid weight';
    }
    if (cost < 1) {
      throw 'Invalid cost';
    }
    feed.feedType = feedType;
    feed.weightKG = weightKG;
    feed.cost = cost;
    feed.updatedAt = DateTime.now();

    await db.writeTxn(() async {
      await db.feeds.put(feed);
    });
  }
}
