import { Schema, SchemaFactory } from "@nestjs/mongoose";
import { HydratedDocument } from "mongoose";

export type UserDocument = HydratedDocument<Pen>

@Schema({ timestamps: true })
export class Pen {

}


export const PenSchema = SchemaFactory.createForClass(Pen)