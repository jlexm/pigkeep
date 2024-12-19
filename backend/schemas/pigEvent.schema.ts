import { Schema, SchemaFactory, Prop } from '@nestjs/mongoose'
import { HydratedDocument } from 'mongoose'

export type PigEventDocument = HydratedDocument<PigEvent>

@Schema({ timestamps: true }) // Adds createdAt and updatedAt automatically
export class PigEvent {
  @Prop({ required: true, unique: true }) // Auto-generate UUID and add index
  uuid: string

  @Prop({ required: true })
  eventDate: Date

  @Prop({ required: true, index: true, ref: 'Pig' })
  pigUuid: string

  @Prop({ required: true })
  pigNumber: string

  @Prop({})
  status: string

  @Prop({ required: true })
  eventType: string

  @Prop({ required: true, index: true }) // Indexed and required farm ID
  farmID: string

  @Prop({ required: true, default: () => Date.now() })
  createdAt: Date // Created timestamp, defaults to now

  @Prop({ required: true, default: () => Date.now() })
  updatedAt: Date // Updated timestamp, defaults to now
}

export const PigEventSchema = SchemaFactory.createForClass(PigEvent)
