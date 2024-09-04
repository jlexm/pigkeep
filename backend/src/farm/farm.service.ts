import { Injectable } from '@nestjs/common';
import { InjectModel } from '@nestjs/mongoose';
import { Model } from 'mongoose';
import { Farm } from 'schemas/farm.schema';
import { CreateFarmDto } from './farm.dto';

@Injectable()
export class FarmService {
    constructor (@InjectModel(Farm.name) private farmModel: Model<Farm>){}

    createFarm(createFarmDto: CreateFarmDto){
        const newFarm = new this.farmModel(createFarmDto)
        newFarm.save()
        return newFarm.toObject()
    }

    async getFarm(filter: Partial<Farm>){
        return this.farmModel.findOne(filter).exec()
    }

    async getFarmCredentials(farm_name: string){
        return this.farmModel
        .findOne(
            {farm_name},
            {_id: 0, farm_name: 1, farm_address:1}
        )
        .exec()
    }
}
