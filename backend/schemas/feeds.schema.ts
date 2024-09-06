import { Schema, SchemaFactory } from "@nestjs/mongoose";
import { HydratedDocument } from "mongoose";

export type UserDocument = HydratedDocument<Feeds>

@Schema({ timestamps: true })
export class Feeds {

}


export const FeedsSchema = SchemaFactory.createForClass(Feeds)