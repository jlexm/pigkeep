import { Injectable } from '@nestjs/common';
import { InjectModel } from '@nestjs/mongoose';
import { Model } from 'mongoose';
import { Disposal, DisposalDocument } from 'schemas/disposal.schema';
import { CreateDisposalDto, UpdateDisposalDto } from './disposal.dto';


@Injectable()
export class DisposalService {
  constructor(@InjectModel(Disposal.name) private disposalModel: Model<DisposalDocument>) {}

  async createDisposal(createDisposalDto: CreateDisposalDto): Promise<Disposal> {
    const newDisposal = new this.disposalModel(createDisposalDto);
    await newDisposal.save();
    return newDisposal.toObject();
  }

  async getDisposalById(id: string): Promise<Disposal> {
    return this.disposalModel.findById(id).exec();
  }

  async updateDisposal(id: string, updateDisposalDto: UpdateDisposalDto): Promise<Disposal> {
    return this.disposalModel.findByIdAndUpdate(id, updateDisposalDto, { new: true }).exec();
  }

  async deleteDisposal(id: string): Promise<any> {
    return this.disposalModel.findByIdAndDelete(id).exec();
  }

  async getAllDisposals(): Promise<Disposal[]> {
    return this.disposalModel.find().exec();
  }
}
