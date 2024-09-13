import { Prop, Schema, SchemaFactory } from '@nestjs/mongoose'
import { HydratedDocument, Schema as MongooseSchema } from 'mongoose'

export type FarmDocument = HydratedDocument<Farm>

// this schema
// auto genertes id stored in _id.
// timestamps auto generetes created and updated fields.
@Schema({ timestamps: true })
export class Farm {
  @Prop({ required: true, minlength: 3, maxlength: 50 })
  farm_name: string

  @Prop({ required: true, minlength: 10, maxlength: 100 })
  farm_address: string

  @Prop({ required: true, type: MongooseSchema.Types.ObjectId, ref: 'User' })
  owner_id: MongooseSchema.Types.ObjectId
}

export const FarmSchema = SchemaFactory.createForClass(Farm)
