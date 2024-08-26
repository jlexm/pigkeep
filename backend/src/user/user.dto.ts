import { IsString, IsEmail, IsEnum, IsOptional, Length } from 'class-validator'
import { Gender, Role } from 'constants/app.constant' // Adjust the import path as needed

export class CreateUserDto {
  @IsString()
  @Length(1, 50)
  username: string

  @IsString()
  password: string

  @IsOptional()
  @IsEmail()
  @Length(0, 255)
  email?: string

  @IsOptional()
  @IsString()
  @Length(0, 10)
  phone_number?: string

  @IsOptional()
  @IsString()
  @Length(0, 255)
  profile_pic?: string

  @IsEnum(Gender)
  gender: Gender

  @IsString()
  @Length(1, 100)
  first_name: string

  @IsString()
  @Length(1, 100)
  last_name: string

  @IsEnum(Role)
  role_id: Role // Ensure this matches the type of your role reference
}
