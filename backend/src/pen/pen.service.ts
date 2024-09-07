import { Injectable } from '@nestjs/common';
import { InjectModel } from '@nestjs/mongoose';
import { Model } from 'mongoose';
import { Pen, PenDocument } from 'schemas/pen.schema';
import { CreatePenDto, UpdatePenDto } from './pen.dto';

@Injectable()
export class PenService {
  constructor(@InjectModel(Pen.name) private penModel: Model<PenDocument>) {}

  // Create a new pen
  async createPen(createPenDto: CreatePenDto): Promise<Pen> {
    const newPen = new this.penModel(createPenDto);
    await newPen.save();
    return newPen.toObject();
  }

  // Get a single pen by its ID
  async getPenById(id: string): Promise<Pen> {
    return this.penModel.findById(id).exec();
  }

  // Update a pen by its ID
  async updatePen(id: string, updatePenDto: UpdatePenDto): Promise<Pen> {
    return this.penModel.findByIdAndUpdate(id, updatePenDto, { new: true }).exec();
  }

  // Delete a pen by its ID
  async deletePen(id: string): Promise<any> {
    return this.penModel.findByIdAndDelete(id).exec();
  }

  // Get all pens
  async getAllPens(): Promise<Pen[]> {
    return this.penModel.find().exec();
  }
}
