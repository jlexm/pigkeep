import { Schema, SchemaFactory, Prop } from '@nestjs/mongoose'
import { HydratedDocument } from 'mongoose'

export type MedicinesHistoryDocument = HydratedDocument<MedicinesHistory>

@Schema({ timestamps: true }) // Adds createdAt and updatedAt automatically
export class MedicinesHistory {
  @Prop({ required: true, unique: true }) // Auto-generate UUID and add index
  uuid: string

  @Prop({ required: true, index: true }) // Indexed with validation
  medicineName: string

  @Prop({ required: true }) // Default value for weight
  dosage: string

  @Prop({ type: Number, default: 0 }) // Default value for cost
  quantity: number

  @Prop({ type: Number, default: 0 }) // Default value for cost
  cost: number

  @Prop({ default: 'stock' }) // consumed or stock
  status: string

  @Prop({ index: true, ref: 'Pig' })
  pigUuid: string

  @Prop({ required: true, index: true }) // Indexed and required farm ID
  farmID: string

  @Prop({ required: true, default: () => Date.now() })
  createdAt: Date // Created timestamp, defaults to now

  @Prop({ required: true, default: () => Date.now() })
  updatedAt: Date // Updated timestamp, defaults to now
}

export const MedicinesHistorySchema =
  SchemaFactory.createForClass(MedicinesHistory)
