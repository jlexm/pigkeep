import { IsString, IsInt, IsBoolean, IsDate, IsMongoId, Length } from "class-validator";

export class CreatePigDto {
  @IsMongoId()
  penId: string;

  @IsInt()
  pig_number: number;

  @IsDate()
  date_of_birth: Date;

  @IsInt()
  age?: number;

  @IsString()
  @Length(1, 20)
  age_category: string;

  @IsBoolean()
  sex: boolean;

  @IsInt()
  parent_number?: number;

  @IsInt()
  recorded_weight: number;
}

export class UpdatePigDto {
  @IsInt()
  pig_number?: number;

  @IsDate()
  date_of_birth?: Date;

  @IsInt()
  age?: number;

  @IsString()
  @Length(1, 20)
  age_category?: string;

  @IsBoolean()
  sex?: boolean;

  @IsInt()
  parent_number?: number;

  @IsInt()
  recorded_weight?: number;
}
