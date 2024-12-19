import { Injectable } from '@nestjs/common'
import { InjectModel } from '@nestjs/mongoose'
import { Model } from 'mongoose'
import { FeedsHistory, FeedsHistoryDocument } from 'schemas/feedsHistory.schema'

@Injectable()
export class FeedHistoryService {
  constructor(
    @InjectModel(FeedsHistory.name)
    private feedsHistoryModel: Model<FeedsHistoryDocument>
  ) {}

  async getAllSyncableFeedsHistory(
    farm_id: string,
    last_successful_read_sync: Date | null
  ): Promise<FeedsHistory[]> {
    const query: any = { farmID: farm_id }

    if (last_successful_read_sync) {
      query.updatedAt = { $gt: last_successful_read_sync }
    }

    return this.feedsHistoryModel.find(query).sort({ updatedAt: 1 }).exec()
  }

  async syncFeedsHistory(farm_id: string, feeds: any[]) {
    // loop all pigs check if its exists in db
    // if yes, check which has latest updated at then merge
    // else, add pig to db
    const bulkOps = []

    for (const feed of feeds) {
      // Check if pig exists by farm_id and uuid
      const existingFeed = await this.feedsHistoryModel
        .findOne({ farmID: farm_id, uuid: feed.uuid })
        .exec()

      if (existingFeed) {
        if (feed.updatedAt > existingFeed.updatedAt) {
          bulkOps.push({
            updateOne: {
              filter: { uuid: existingFeed.uuid },
              update: { $set: { ...feed } },
            },
          })
        }
      } else {
        bulkOps.push({
          insertOne: {
            document: feed,
          },
        })
      }
    }

    if (bulkOps.length > 0) {
      await this.feedsHistoryModel.bulkWrite(bulkOps)
    }
  }
}
