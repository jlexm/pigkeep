import { Schema, SchemaFactory } from "@nestjs/mongoose";
import { HydratedDocument } from "mongoose";

export type UserDocument = HydratedDocument<Medicine>

@Schema({ timestamps: true })
export class Medicine {

}


export const MedicineSchema = SchemaFactory.createForClass(Medicine)