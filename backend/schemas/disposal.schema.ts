import { Schema, SchemaFactory, Prop } from "@nestjs/mongoose";
import { HydratedDocument } from "mongoose";

export type DisposalDocument = HydratedDocument<Disposal>;

@Schema({ timestamps: true })
export class Disposal {
  @Prop({ required: true })
  disposal_number: number;

  @Prop({ required: true, minlength: 3, maxlength: 30 })
  disposal_type: string;

  @Prop({ required: true })
  date_of_disposal: Date;

  @Prop({ required: true })
  price_sold: number;
}

export const DisposalSchema = SchemaFactory.createForClass(Disposal);
