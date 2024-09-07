import { IsString, IsInt, Length } from "class-validator";

export class CreateFeedsDto {
  @IsInt()
  feed_number: number;

  @IsString()
  @Length(1, 30)
  feed_type: string;
}

export class UpdateFeedsDto {
  @IsInt()
  feed_number?: number;

  @IsString()
  @Length(1, 30)
  feed_type?: string;
}
