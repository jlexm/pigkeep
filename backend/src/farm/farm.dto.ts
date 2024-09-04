import { IsString, Length } from "class-validator";

export class CreateFarmDto {

    @IsString()
    @Length(1, 50)
    farm_name: string
  
    @IsString()
    @Length(1, 50)
    farm_address: string
  
}