import { Injectable } from '@nestjs/common'
import { InjectModel } from '@nestjs/mongoose'
import { Model } from 'mongoose'
import { Pig, PigDocument } from 'schemas/pig.schema'
import { CreatePigDto, UpdatePigDto } from './pig.dto'

@Injectable()
export class PigService {
  constructor(@InjectModel(Pig.name) private pigModel: Model<PigDocument>) {}

  async createPig(createPigDto: CreatePigDto): Promise<Pig> {
    const newPig = new this.pigModel(createPigDto)
    await newPig.save()
    return newPig.toObject()
  }

  async getPigById(id: string): Promise<Pig> {
    return this.pigModel.findById(id).exec()
  }

  async updatePig(id: string, updatePigDto: UpdatePigDto): Promise<Pig> {
    return this.pigModel
      .findByIdAndUpdate(id, updatePigDto, { new: true })
      .exec()
  }

  async deletePig(id: string): Promise<any> {
    return this.pigModel.findByIdAndDelete(id).exec()
  }

  async getAllPigs(): Promise<Pig[]> {
    return this.pigModel.find().exec()
  }

  async getAllSyncablePigs(
    farm_id: string,
    last_successful_read_sync: Date | null
  ): Promise<Pig[]> {
    const query: any = { farmID: farm_id }

    if (last_successful_read_sync) {
      query.updatedAt = { $gt: last_successful_read_sync }
    }

    return this.pigModel.find(query).sort({ updatedAt: 1 }).exec()
  }

  async syncPigs(farm_id: string, pigs: any[]) {
    // loop all pigs check if its exists in db
    // if yes, check which has latest updated at then merge
    // else, add pig to db
    const bulkOps = []

    for (const pig of pigs) {
      // Check if pig exists by farm_id and uuid
      const existingPig = await this.pigModel
        .findOne({ farmID: farm_id, uuid: pig.uuid })
        .exec()

      if (existingPig) {
        if (pig.updatedAt > existingPig.updatedAt) {
          bulkOps.push({
            updateOne: {
              filter: { uuid: existingPig.uuid },
              update: { $set: { ...pig } },
            },
          })
        }
      } else {
        bulkOps.push({
          insertOne: {
            document: pig,
          },
        })
      }
    }

    if (bulkOps.length > 0) {
      await this.pigModel.bulkWrite(bulkOps)
    }
  }
}
