import { Schema, SchemaFactory, Prop } from '@nestjs/mongoose'
import { HydratedDocument } from 'mongoose'

export type FeedsDocument = HydratedDocument<Feeds>

@Schema({ timestamps: true }) // Adds createdAt and updatedAt automatically
export class Feeds {
  @Prop({ required: true, unique: true }) // Auto-generate UUID and add index
  uuid: string

  @Prop({ required: true, minlength: 3, maxlength: 30, index: true }) // Indexed with validation
  feedType: string

  @Prop({ type: Number, default: 0 }) // Default value for weight
  weightKG: number

  @Prop({ type: Number, default: 0 }) // Default value for cost
  cost: number

  @Prop({ required: true, index: true }) // Indexed and required farm ID
  farmID: string

  @Prop({ required: true, default: () => Date.now() })
  createdAt: Date // Created timestamp, defaults to now

  @Prop({ required: true, default: () => Date.now() })
  updatedAt: Date // Updated timestamp, defaults to now
}

export const FeedsSchema = SchemaFactory.createForClass(Feeds)
