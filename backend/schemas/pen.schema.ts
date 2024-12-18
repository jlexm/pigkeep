import { Schema, SchemaFactory, Prop } from '@nestjs/mongoose'
import { HydratedDocument, Types } from 'mongoose'

// Define the document type
export type PenDocument = HydratedDocument<Pen>

@Schema()
export class Pen {
  @Prop({ type: Types.ObjectId, required: true, ref: 'Farm' })
  farmID: Types.ObjectId // References a `Farm` document

  @Prop({ required: true, unique: true })
  uuid: string // Unique identifier for the PigPen

  @Prop()
  userOwner: string // Nullable field to store the user owner

  @Prop({ required: true })
  penNumber: string // Pen number

  @Prop({ required: true })
  penType: string // Type of pen

  @Prop({ required: true, default: 0 })
  maxPigCount: number // Maximum number of pigs allowed in the pen

  @Prop({ required: true, default: 0 })
  currentPigCount: number // Current number of pigs in the pen

  @Prop({ required: true, default: () => Date.now() })
  createdAt: Date // Created timestamp, defaults to now

  @Prop({ required: true, default: () => Date.now() })
  updatedAt: Date // Updated timestamp, defaults to now
}

// Generate the schema
export const PenSchema = SchemaFactory.createForClass(Pen)
