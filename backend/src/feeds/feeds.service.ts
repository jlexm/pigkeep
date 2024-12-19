import { Injectable } from '@nestjs/common'
import { InjectModel } from '@nestjs/mongoose'
import { Model } from 'mongoose'
import { Feeds, FeedsDocument } from 'schemas/feeds.schema'
import { CreateFeedsDto, UpdateFeedsDto } from './feeds.dto'

@Injectable()
export class FeedsService {
  constructor(
    @InjectModel(Feeds.name) private feedsModel: Model<FeedsDocument>
  ) {}

  async createFeeds(createFeedsDto: CreateFeedsDto): Promise<Feeds> {
    const newFeeds = new this.feedsModel(createFeedsDto)
    await newFeeds.save()
    return newFeeds.toObject()
  }

  async getFeedsById(id: string): Promise<Feeds> {
    return this.feedsModel.findById(id).exec()
  }

  async updateFeeds(
    id: string,
    updateFeedsDto: UpdateFeedsDto
  ): Promise<Feeds> {
    return this.feedsModel
      .findByIdAndUpdate(id, updateFeedsDto, { new: true })
      .exec()
  }

  async deleteFeeds(id: string): Promise<any> {
    return this.feedsModel.findByIdAndDelete(id).exec()
  }

  async getAllFeeds(): Promise<Feeds[]> {
    return this.feedsModel.find().exec()
  }

  async getAllSyncableFeeds(
    farm_id: string,
    last_successful_read_sync: Date | null
  ): Promise<Feeds[]> {
    const query: any = { farmID: farm_id }

    if (last_successful_read_sync) {
      query.updatedAt = { $gt: last_successful_read_sync }
    }

    return this.feedsModel.find(query).sort({ updatedAt: 1 }).exec()
  }

  async syncFeeds(farm_id: string, feeds: any[]) {
    // loop all pigs check if its exists in db
    // if yes, check which has latest updated at then merge
    // else, add pig to db
    const bulkOps = []

    for (const feed of feeds) {
      // Check if pig exists by farm_id and uuid
      const existingFeed = await this.feedsModel
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
      await this.feedsModel.bulkWrite(bulkOps)
    }
  }
}
