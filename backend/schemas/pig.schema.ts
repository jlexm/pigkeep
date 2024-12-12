import { Schema, SchemaFactory, Prop } from '@nestjs/mongoose'
import { HydratedDocument, Types } from 'mongoose'

export type PigDocument = HydratedDocument<Pig>

@Schema({ timestamps: true })
export class Pig {
  @Prop({ required: true, index: true })
  userOwner: string

  @Prop({ required: true, index: true, ref: 'Pen' })
  penUuid: string

  @Prop({ required: true, index: true })
  pigNumber: string

  @Prop({ required: true, index: true })
  farmID: string

  @Prop({ required: false, index: true })
  parentUuid: string

  @Prop({ required: true, index: true })
  uuid: string

  @Prop({ required: true })
  dob: Date

  @Prop({ required: true })
  sex: boolean

  @Prop({ required: true, default: 'alive' })
  status: string

  @Prop({ required: false })
  weightKG: number

  @Prop({ required: false })
  lastWeightRecorded: Date

  @Prop({ required: true, default: Date.now })
  createdAt: Date

  @Prop({ required: true, default: Date.now })
  updatedAt: Date
}

export const PigSchema = SchemaFactory.createForClass(Pig)
