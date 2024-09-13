import { IsMongoId, IsString, Length } from 'class-validator'

export class CreateFarmDto {
  @IsString()
  @Length(3, 50)
  farm_name: string

  @IsString()
  @Length(10, 100)
  farm_address: string
}

export class UpdateFarmDto {
  @IsString()
  @Length(3, 50)
  farm_name?: string

  @IsString()
  @Length(10, 100)
  farm_address?: string
}
