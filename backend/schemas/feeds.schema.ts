import { Schema, SchemaFactory, Prop } from "@nestjs/mongoose";
import { HydratedDocument } from "mongoose";

export type FeedsDocument = HydratedDocument<Feeds>;

@Schema({ timestamps: true })
export class Feeds {
  @Prop({ required: true })
  feed_number: number;

  @Prop({ required: true, minlength: 3, maxlength: 30 })
  feed_type: string;
}

export const FeedsSchema = SchemaFactory.createForClass(Feeds);
