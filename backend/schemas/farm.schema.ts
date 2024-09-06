import { Prop, Schema, SchemaFactory } from "@nestjs/mongoose"
import { HydratedDocument } from "mongoose"

export type UserDocument = HydratedDocument<Farm>

// this schema
// auto genertes id stored in _id.
// timestamps auto generetes created and updated fields.
@Schema({ timestamps: true })
export class Farm {

  @Prop({ required: true, maxlength: 50, unique: true })
  farm_name: string

  @Prop({ maxlength: 50})
  farm_address: string

}

export const FarmSchema = SchemaFactory.createForClass(Farm)
