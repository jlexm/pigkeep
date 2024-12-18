import {
  IsString,
  IsInt,
  Length,
  IsMongoId,
  IsNotEmpty,
  IsNumber,
  IsOptional,
  IsUUID,
  IsDate,
} from 'class-validator'
import { Types } from 'mongoose'

export class CreatePenDto {
  @IsMongoId()
  farmId: string

  @IsInt()
  pen_number: number

  @IsInt()
  pig_count: number

  @IsInt()
  max_pigs: number

  @IsString()
  @Length(1, 20)
  type: string
}

export class UpdatePenDto {
  @IsInt()
  pen_number?: number

  @IsInt()
  pig_count?: number

  @IsInt()
  max_pigs?: number

  @IsString()
  @Length(1, 20)
  type?: string
}

export class syncPenDto {
  @IsString()
  @IsNotEmpty()
  farmID: Types.ObjectId // ID of the farm the pen belongs to

  @IsUUID()
  @IsNotEmpty()
  uuid: string // Unique identifier for the PigPen

  @IsString()
  @IsOptional()
  userOwner?: string // Nullable field to store the user owner

  @IsString()
  @IsNotEmpty()
  penNumber: string // Pen number

  @IsString()
  @IsNotEmpty()
  penType: string // Type of pen

  @IsNumber()
  @IsNotEmpty()
  maxPigCount: number // Maximum number of pigs allowed in the pen

  @IsNumber()
  @IsNotEmpty()
  currentPigCount: number // Current number of pigs in the pen

  @IsDate()
  @IsNotEmpty()
  createdAt: Date // Optional field for createdAt

  @IsDate()
  @IsNotEmpty()
  updatedAt: Date // Optional field for updatedAt
}
