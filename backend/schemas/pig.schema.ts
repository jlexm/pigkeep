import { Schema, SchemaFactory } from "@nestjs/mongoose";
import { HydratedDocument } from "mongoose";

export type UserDocument = HydratedDocument<Pig>

@Schema({ timestamps: true })
export class Pig {

}


export const PigSchema = SchemaFactory.createForClass(Pig)