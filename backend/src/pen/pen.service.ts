import { Injectable } from '@nestjs/common'
import { InjectModel } from '@nestjs/mongoose'
import { Model } from 'mongoose'
import { Pen, PenDocument } from 'schemas/pen.schema'
import { CreatePenDto, syncPenDto, UpdatePenDto } from './pen.dto'
import { DateTime } from 'luxon'

@Injectable()
export class PenService {
  constructor(@InjectModel(Pen.name) private penModel: Model<PenDocument>) {}

  // Create a new pen
  async createPen(createPenDto: CreatePenDto): Promise<Pen> {
    const newPen = new this.penModel(createPenDto)
    await newPen.save()
    return newPen.toObject()
  }

  // Get a single pen by its ID
  async getPenById(id: string): Promise<Pen> {
    return this.penModel.findById(id).exec()
  }

  // Update a pen by its ID
  async updatePen(id: string, updatePenDto: UpdatePenDto): Promise<Pen> {
    return this.penModel
      .findByIdAndUpdate(id, updatePenDto, { new: true })
      .exec()
  }

  // Delete a pen by its ID
  async deletePen(id: string): Promise<any> {
    return this.penModel.findByIdAndDelete(id).exec()
  }

  // Get all pens
  async getAllPens(): Promise<Pen[]> {
    return this.penModel.find().exec()
  }

  async getAllSyncablePens(
    farm_id: string,
    last_successful_read_sync: Date | null
  ): Promise<Pen[]> {
    const query: any = { farmID: farm_id }

    if (last_successful_read_sync) {
      query.updatedAt = { $gt: last_successful_read_sync }
    }

    return this.penModel.find(query).sort({ updatedAt: 1 }).exec()
  }

  async syncPens(farm_id: string, pens: any[]) {
    // loop all pens check if its exists in db
    // if yes, check which has latest updated at then merge
    // else, add pen to db
    const bulkOps = []

    for (const pen of pens) {
      // Check if pen exists by farm_id and uuid
      const existingPen = await this.penModel
        .findOne({ farmID: farm_id, uuid: pen.uuid })
        .exec()

      if (existingPen) {
        if (
          DateTime.fromISO(pen.updatedAt).toJSDate() > existingPen.updatedAt
        ) {
          bulkOps.push({
            updateOne: {
              filter: { uuid: existingPen.uuid },
              update: { $set: { ...pen } },
            },
          })
        }
      } else {
        bulkOps.push({
          insertOne: {
            document: pen,
          },
        })
      }
    }

    if (bulkOps.length > 0) {
      await this.penModel.bulkWrite(bulkOps)
    }
  }

  async getPensByFarmId(farm_id: string) {
    return this.penModel.aggregate([
      { $match: { farmID: farm_id } },
      {
        $lookup: {
          from: 'pigs',
          localField: 'uuid',
          foreignField: 'penUuid',
          as: 'pigs'
        }
      }
    ]).exec();
  }
}
