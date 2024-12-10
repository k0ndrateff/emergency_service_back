import {IsString} from "class-validator";
import 'reflect-metadata';

export class CreateOperatorDto {
  @IsString()
  first_name: string;

  @IsString()
  last_name: string;

  @IsString()
  middle_name: string;
}
