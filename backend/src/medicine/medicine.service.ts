import { Injectable } from '@nestjs/common'
import { InjectModel } from '@nestjs/mongoose'
import { Model } from 'mongoose'
import { Medicine, MedicineDocument } from 'schemas/medicine.schema'
import { CreateMedicineDto, UpdateMedicineDto } from './medicine.dto'
import { DateTime } from 'luxon'

@Injectable()
export class MedicineService {
  constructor(
    @InjectModel(Medicine.name) private medicineModel: Model<MedicineDocument>
  ) {}

  async createMedicine(
    createMedicineDto: CreateMedicineDto
  ): Promise<Medicine> {
    const newMedicine = new this.medicineModel(createMedicineDto)
    await newMedicine.save()
    return newMedicine.toObject()
  }

  async getMedicineById(id: string): Promise<Medicine> {
    return this.medicineModel.findById(id).exec()
  }

  async updateMedicine(
    id: string,
    updateMedicineDto: UpdateMedicineDto
  ): Promise<Medicine> {
    return this.medicineModel
      .findByIdAndUpdate(id, updateMedicineDto, { new: true })
      .exec()
  }

  async deleteMedicine(id: string): Promise<any> {
    return this.medicineModel.findByIdAndDelete(id).exec()
  }

  async getAllMedicine(): Promise<Medicine[]> {
    return this.medicineModel.find().exec()
  }

  async getAllSyncableMeds(
    farm_id: string,
    last_successful_read_sync: Date | null
  ): Promise<Medicine[]> {
    const query: any = { farmID: farm_id }

    if (last_successful_read_sync) {
      query.updatedAt = { $gt: last_successful_read_sync }
    }

    return this.medicineModel.find(query).sort({ updatedAt: 1 }).exec()
  }

  async syncMeds(farm_id: string, meds: any[]) {
    // loop all meds check if its exists in db
    // if yes, check which has latest updated at then merge
    // else, add med to db
    const bulkOps = []

    for (const med of meds) {
      // Check if med exists by farm_id and uuid
      const existingMed = await this.medicineModel
        .findOne({ farmID: farm_id, uuid: med.uuid })
        .exec()

      if (existingMed) {
        if (
          DateTime.fromISO(med.updatedAt).toJSDate() > existingMed.updatedAt
        ) {
          bulkOps.push({
            updateOne: {
              filter: { uuid: existingMed.uuid },
              update: { $set: { ...med } },
            },
          })
        }
      } else {
        bulkOps.push({
          insertOne: {
            document: med,
          },
        })
      }
    }

    if (bulkOps.length > 0) {
      await this.medicineModel.bulkWrite(bulkOps)
    }
  }
}
