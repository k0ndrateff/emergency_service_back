import 'reflect-metadata';
import {IsBoolean, IsPositive, IsString} from "class-validator";

export class Operator {
  @IsPositive()
  id: number;

  @IsString()
  first_name: string;

  @IsString()
  last_name: string;

  @IsString()
  middle_name: string;

  /**
   * Boolean indicating whether specific operator is currently free to answer calls.
   */
  @IsBoolean()
  is_free: boolean;
}
