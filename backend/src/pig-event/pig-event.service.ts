import { Injectable } from '@nestjs/common'
import { InjectModel } from '@nestjs/mongoose'
import { DateTime } from 'luxon'
import { Model } from 'mongoose'
import { PigEvent, PigEventDocument } from 'schemas/pigEvent.schema'

@Injectable()
export class PigEventService {
  constructor(
    @InjectModel(PigEvent.name)
    private pigEventModel: Model<PigEventDocument>
  ) {}

  async getAllSyncablePigEvents(
    farm_id: string,
    last_successful_read_sync: Date | null
  ): Promise<PigEvent[]> {
    const query: any = { farmID: farm_id }

    if (last_successful_read_sync) {
      query.updatedAt = { $gt: last_successful_read_sync }
    }

    return this.pigEventModel.find(query).sort({ updatedAt: 1 }).exec()
  }

  async syncPigEvents(farm_id: string, data: any[]) {
    // loop all pigs check if its exists in db
    // if yes, check which has latest updated at then merge
    // else, add pig to db
    const bulkOps = []

    for (const val of data) {
      // Check if pig exists by farm_id and uuid
      const existingVal = await this.pigEventModel
        .findOne({ farmID: farm_id, uuid: val.uuid })
        .exec()

      if (existingVal) {
        if (
          DateTime.fromISO(val.updatedAt).toJSDate() > existingVal.updatedAt
        ) {
          bulkOps.push({
            updateOne: {
              filter: { uuid: existingVal.uuid },
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
      await this.pigEventModel.bulkWrite(bulkOps)
    }
  }
}
