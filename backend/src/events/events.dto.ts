import { IsString, IsInt, Length } from "class-validator";

export class CreateEventsDto {
  @IsInt()
  event_number: number;

  @IsString()
  @Length(1, 50)
  event_type: string;
}

export class UpdateEventsDto {
  @IsInt()
  event_number?: number;

  @IsString()
  @Length(1, 50)
  event_type?: string;
}
