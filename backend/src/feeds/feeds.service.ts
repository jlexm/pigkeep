import { Injectable } from '@nestjs/common';
import { InjectModel } from '@nestjs/mongoose';
import { Model } from 'mongoose';
import { Feeds, FeedsDocument } from 'schemas/feeds.schema';
import { CreateFeedsDto, UpdateFeedsDto } from './feeds.dto';

@Injectable()
export class FeedsService {
  constructor(@InjectModel(Feeds.name) private feedsModel: Model<FeedsDocument>) {}

  async createFeeds(createFeedsDto: CreateFeedsDto): Promise<Feeds> {
    const newFeeds = new this.feedsModel(createFeedsDto);
    await newFeeds.save();
    return newFeeds.toObject();
  }

  async getFeedsById(id: string): Promise<Feeds> {
    return this.feedsModel.findById(id).exec();
  }

  async updateFeeds(id: string, updateFeedsDto: UpdateFeedsDto): Promise<Feeds> {
    return this.feedsModel.findByIdAndUpdate(id, updateFeedsDto, { new: true }).exec();
  }

  async deleteFeeds(id: string): Promise<any> {
    return this.feedsModel.findByIdAndDelete(id).exec();
  }

  async getAllFeeds(): Promise<Feeds[]> {
    return this.feedsModel.find().exec();
  }
}
