import { IsString, IsInt, Length, IsMongoId } from "class-validator";

export class CreatePenDto {
  @IsMongoId()
  farmId: string;

  @IsInt()
  pen_number: number;

  @IsInt()
  pig_count: number;

  @IsInt()
  max_pigs: number;

  @IsString()
  @Length(1, 20)
  type: string;
}

export class UpdatePenDto {
  @IsInt()
  pen_number?: number;

  @IsInt()
  pig_count?: number;

  @IsInt()
  max_pigs?: number;

  @IsString()
  @Length(1, 20)
  type?: string;
}
