import { Schema, SchemaFactory, Prop } from "@nestjs/mongoose";
import { HydratedDocument } from "mongoose";

export type MedicineDocument = HydratedDocument<Medicine>;

@Schema({ timestamps: true })
export class Medicine {
  @Prop({ required: true })
  medicine_number: number;

  @Prop({ required: true, minlength: 3, maxlength: 50 })
  medicine_name: string;

  @Prop({ required: true })
  unit: number;

  @Prop({ required: true })
  quantity: number;

  @Prop({ required: true })
  cost: number;
}

export const MedicineSchema = SchemaFactory.createForClass(Medicine);
