import { IsString, IsInt, IsNumber, IsDate, Length } from "class-validator";

export class CreateDisposalDto {
  @IsInt()
  disposal_number: number;

  @IsString()
  @Length(1, 30)
  disposal_type: string;

  @IsDate()
  date_of_disposal: Date;

  @IsNumber()
  price_sold: number;
}

export class UpdateDisposalDto {
  @IsInt()
  disposal_number?: number;

  @IsString()
  @Length(1, 30)
  disposal_type?: string;

  @IsDate()
  date_of_disposal?: Date;

  @IsNumber()
  price_sold?: number;
}
