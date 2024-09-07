import { Injectable } from '@nestjs/common';
import { InjectModel } from '@nestjs/mongoose';
import { Model } from 'mongoose';
import { Events, EventsDocument } from 'schemas/events.schema';
import { CreateEventsDto, UpdateEventsDto } from './events.dto';


@Injectable()
export class EventsService {
  constructor(@InjectModel(Events.name) private eventsModel: Model<EventsDocument>) {}

  async createEvent(createEventsDto: CreateEventsDto): Promise<Events> {
    const newEvent = new this.eventsModel(createEventsDto);
    await newEvent.save();
    return newEvent.toObject();
  }

  async getEventById(id: string): Promise<Events> {
    return this.eventsModel.findById(id).exec();
  }

  async updateEvent(id: string, updateEventsDto: UpdateEventsDto): Promise<Events> {
    return this.eventsModel.findByIdAndUpdate(id, updateEventsDto, { new: true }).exec();
  }

  async deleteEvent(id: string): Promise<any> {
    return this.eventsModel.findByIdAndDelete(id).exec();
  }

  async getAllEvents(): Promise<Events[]> {
    return this.eventsModel.find().exec();
  }
}
