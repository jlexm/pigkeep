import { Injectable } from '@nestjs/common'
import { InjectModel } from '@nestjs/mongoose'
import { Model } from 'mongoose'
import { Farm, FarmDocument } from 'schemas/farm.schema'
import { CreateFarmDto, UpdateFarmDto } from './farm.dto'

@Injectable()
export class FarmService {
  constructor(@InjectModel(Farm.name) private farmModel: Model<FarmDocument>) {}

  async createFarm(farm: {
    owner_id: string
    farm_name: string
    farm_address: string
  }): Promise<Farm> {
    const newFarm = new this.farmModel(farm)
    await newFarm.save()
    return newFarm.toObject()
  }

  async getFarmById(id: string): Promise<Farm> {
    return this.farmModel.findById(id).exec()
  }

  async updateFarm(id: string, updateFarmDto: UpdateFarmDto): Promise<Farm> {
    return this.farmModel
      .findByIdAndUpdate(id, updateFarmDto, { new: true })
      .exec()
  }

  async deleteFarm(id: string): Promise<any> {
    return this.farmModel.findByIdAndDelete(id).exec()
  }

  async getAllFarms(): Promise<Farm[]> {
    return this.farmModel.find().exec()
  }

  /*  User Actions */
  async getMyFarms(username: string): Promise<Farm[]> {
    return this.farmModel
      .aggregate([
        {
          $lookup: {
            from: 'users',
            localField: 'owner_id',
            foreignField: '_id',
            as: 'owner',
          },
        },
        {
          $match: {
            'owner.username': username,
          },
        },
        {
          $project: {
            _id: 1,
            farm_name: 1,
            farm_address: 1,
            owner_id: 1,
          },
        },
      ])
      .exec()
  }
}
