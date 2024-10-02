import 'reflect-metadata';
import {IsBoolean, IsPositive, IsString} from "class-validator";

/**
 * Operator definition. Also used as DTO to return full operator information.
 * @see CreateOperatorDto
 */
export class Operator {
  /**
   * ID of the operator. Positive integer.
   * @example 123
   */
  @IsPositive()
  id: number;

  /**
   * First name of the operator.
   * @example "Egor"
   */
  @IsString()
  first_name: string;

  /**
   * Last name of the operator.
   * @example "Kondratev"
   */
  @IsString()
  last_name: string;

  /**
   * Middle name (actually patronymic) of the operator.
   * @example "Ivanovich"
   */
  @IsString()
  middle_name: string;

  /**
   * Boolean indicating whether specific operator is currently free to answer calls.
   */
  @IsBoolean()
  is_free: boolean;
}
