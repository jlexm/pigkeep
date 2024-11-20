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
}
