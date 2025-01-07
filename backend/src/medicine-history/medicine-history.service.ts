import { Injectable } from '@nestjs/common'
import { InjectModel } from '@nestjs/mongoose'
import { DateTime } from 'luxon'
import { Model } from 'mongoose'
import {
  MedicinesHistory,
  MedicinesHistoryDocument,
} from 'schemas/medicinesHistory.schema'

@Injectable()
export class MedicineHistoryService {
  constructor(
    @InjectModel(MedicinesHistory.name)
    private medicinesHistory: Model<MedicinesHistoryDocument>
  ) {}

  async getAllSyncableMedsHistory(
    farm_id: string,
    last_successful_read_sync: Date | null
  ): Promise<MedicinesHistory[]> {
    const query: any = { farmID: farm_id }

    if (last_successful_read_sync) {
      query.updatedAt = { $gt: last_successful_read_sync }
    }

    return this.medicinesHistory.find(query).sort({ updatedAt: 1 }).exec()
  }

  async syncMedsHistory(farm_id: string, data: any[]) {
    // loop all pigs check if its exists in db
    // if yes, check which has latest updated at then merge
    // else, add pig to db
    const bulkOps = []

    for (const val of data) {
      // Check if pig exists by farm_id and uuid
      const existingVal = await this.medicinesHistory
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
      await this.medicinesHistory.bulkWrite(bulkOps)
    }
  }

  async getMedicineHistoryByFarmID(farm_id: string) {
    return this.medicinesHistory.find({ farmID: farm_id }).exec()
  }

}
