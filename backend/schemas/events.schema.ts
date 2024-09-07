import { Schema, SchemaFactory, Prop } from "@nestjs/mongoose";
import { HydratedDocument } from "mongoose";

export type EventsDocument = HydratedDocument<Events>;

@Schema({ timestamps: true })
export class Events {
  @Prop({ required: true })
  event_number: number;

  @Prop({ required: true, minlength: 3, maxlength: 50 })
  event_type: string;
}

export const EventsSchema = SchemaFactory.createForClass(Events);
