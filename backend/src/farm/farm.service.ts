import { Injectable } from '@nestjs/common';
import { InjectModel } from '@nestjs/mongoose';
import { Model } from 'mongoose';
import { Farm, FarmDocument , } from 'schemas/farm.schema';
import { CreateFarmDto, UpdateFarmDto } from './farm.dto';


@Injectable()
export class FarmService {
  constructor(@InjectModel(Farm.name) private farmModel: Model<FarmDocument>) {}

  async createFarm(createFarmDto: CreateFarmDto): Promise<Farm> {
    const newFarm = new this.farmModel(createFarmDto);
    await newFarm.save();
    return newFarm.toObject();
  }

  async getFarmById(id: string): Promise<Farm> {
    return this.farmModel.findById(id).exec();
  }

  async updateFarm(id: string, updateFarmDto: UpdateFarmDto): Promise<Farm> {
    return this.farmModel.findByIdAndUpdate(id, updateFarmDto, { new: true }).exec();
  }

  async deleteFarm(id: string): Promise<any> {
    return this.farmModel.findByIdAndDelete(id).exec();
  }

  async getAllFarms(): Promise<Farm[]> {
    return this.farmModel.find().exec();
  }
}
