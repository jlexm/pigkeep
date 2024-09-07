import { Schema, SchemaFactory, Prop } from "@nestjs/mongoose";
import { HydratedDocument, Types } from "mongoose";

export type PenDocument = HydratedDocument<Pen>;

@Schema({ timestamps: true })
export class Pen {
  @Prop({ type: Types.ObjectId, required: true, ref: 'Farm' })
  farmId: Types.ObjectId;

  @Prop({ required: true })
  pen_number: number;

  @Prop({ required: true })
  pig_count: number;

  @Prop({ required: true })
  max_pigs: number;

  @Prop({ required: true, minlength: 3, maxlength: 20 })
  type: string;
}

export const PenSchema = SchemaFactory.createForClass(Pen);
