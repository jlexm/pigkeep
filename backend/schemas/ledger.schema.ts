import { Schema, SchemaFactory, Prop } from '@nestjs/mongoose'
import { HydratedDocument, Types } from 'mongoose'

export type LegderDocument = HydratedDocument<Legder>

@Schema({ timestamps: true }) // Adds createdAt and updatedAt automatically
export class Legder {
  @Prop({ type: Types.ObjectId, required: true, ref: 'Farm' })
  farmID: Types.ObjectId // References a `Farm` document

  @Prop({ required: true, unique: true })
  uuid: string // Unique identifier for the PigPen

  @Prop()
  userOwner: string // Nullable field to store the user owner

  @Prop({ required: true, default: 'deceased' })
  status: string // deceased or sold

  @Prop({ required: true, default: () => Date.now() })
  transactionDate: Date // Created timestamp, defaults to now

  @Prop()
  priceSold: number

  @Prop()
  weightKG: number

  @Prop({ type: Types.ObjectId, required: true, ref: 'pig' })
  pigUuid: Types.ObjectId

  @Prop({ required: true, default: () => Date.now() })
  createdAt: Date // Created timestamp, defaults to now

  @Prop({ required: true, default: () => Date.now() })
  updatedAt: Date // Updated timestamp, defaults to now
}

export const LegderSchema = SchemaFactory.createForClass(Legder)
