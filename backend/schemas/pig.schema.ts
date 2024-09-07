import { Schema, SchemaFactory, Prop } from "@nestjs/mongoose";
import { HydratedDocument, Types } from "mongoose";

export type PigDocument = HydratedDocument<Pig>;

@Schema({ timestamps: true })
export class Pig {
  @Prop({ type: Types.ObjectId, required: true, ref: 'Pen' })
  penId: Types.ObjectId;

  @Prop({ required: true })
  pig_number: number;

  @Prop({ required: true })
  date_of_birth: Date;

  @Prop()
  age: number;

  @Prop({ required: true, minlength: 3, maxlength: 20 })
  age_category: string;

  @Prop({ required: true })
  sex: boolean;

  @Prop()
  parent_number: number;

  @Prop({ required: true })
  recorded_weight: number;
}

export const PigSchema = SchemaFactory.createForClass(Pig);
