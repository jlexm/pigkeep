import { IsString, IsInt, IsNumber, Length } from "class-validator";

export class CreateMedicineDto {
  @IsInt()
  medicine_number: number;

  @IsString()
  @Length(1, 50)
  medicine_name: string;

  @IsNumber()
  unit: number;

  @IsNumber()
  quantity: number;

  @IsNumber()
  cost: number;
}

export class UpdateMedicineDto {
  @IsInt()
  medicine_number?: number;

  @IsString()
  @Length(1, 50)
  medicine_name?: string;

  @IsNumber()
  unit?: number;

  @IsNumber()
  quantity?: number;

  @IsNumber()
  cost?: number;
}
