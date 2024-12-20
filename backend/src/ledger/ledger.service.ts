import { Injectable } from '@nestjs/common'
import { InjectModel } from '@nestjs/mongoose'
import { DateTime } from 'luxon'
import { Model } from 'mongoose'
import { FeedsHistory, FeedsHistoryDocument } from 'schemas/feedsHistory.schema'
import { Legder, LegderDocument } from 'schemas/ledger.schema'

@Injectable()
export class LedgerService {
  constructor(
    @InjectModel(Legder.name)
    private ledgerModel: Model<LegderDocument>
  ) {}

  async getAllSyncableLedgers(
    farm_id: string,
    last_successful_read_sync: Date | null
  ): Promise<Legder[]> {
    const query: any = { farmID: farm_id }

    if (last_successful_read_sync) {
      query.updatedAt = { $gt: last_successful_read_sync }
    }

    return this.ledgerModel.find(query).sort({ updatedAt: 1 }).exec()
  }

  async syncLedgers(farm_id: string, data: any[]) {
    // loop all pigs check if its exists in db
    // if yes, check which has latest updated at then merge
    // else, add pig to db
    const bulkOps = []

    for (const val of data) {
      // Check if pig exists by farm_id and uuid
      const existingFeed = await this.ledgerModel
        .findOne({ farmID: farm_id, uuid: val.uuid })
        .exec()

      if (existingFeed) {
        if (
          DateTime.fromISO(val.updatedAt).toJSDate() > existingFeed.updatedAt
        ) {
          bulkOps.push({
            updateOne: {
              filter: { uuid: existingFeed.uuid },
              update: { $set: { ...val } },
            },
          })
        }
      } else {
        bulkOps.push({
          insertOne: {
            document: val,
          },
        })
      }
    }

    if (bulkOps.length > 0) {
      await this.ledgerModel.bulkWrite(bulkOps)
    }
  }
}
