import { Schema, SchemaFactory, Prop } from '@nestjs/mongoose'
import { HydratedDocument } from 'mongoose'

export type MedicineDocument = HydratedDocument<Medicine>

@Schema({ timestamps: true })
export class Medicine {
  @Prop({ required: true, unique: true }) // Auto-generate UUID and add index
  uuid: string

  @Prop({ required: true, index: true }) // Indexed with validation
  medicineName: string

  @Prop({ required: true }) // Default value for weight
  dosage: string

  @Prop({}) // Default value for weight
  description: string

  @Prop({ type: Number, default: 0 }) // Default value for cost
  quantity: number

  @Prop({ type: Number, default: 0 }) // Default value for cost
  avgCost: number

  @Prop({ required: true, index: true }) // Indexed and required farm ID
  farmID: string

  @Prop({ required: true, default: () => Date.now() })
  createdAt: Date // Created timestamp, defaults to now

  @Prop({ required: true, default: () => Date.now() })
  updatedAt: Date // Updated timestamp, defaults to now
}

export const MedicineSchema = SchemaFactory.createForClass(Medicine)
