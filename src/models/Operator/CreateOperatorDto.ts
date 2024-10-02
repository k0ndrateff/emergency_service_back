import {IsString} from "class-validator";
import 'reflect-metadata';

/**
 * DTO which is used to create operator.
 * @see Operator
 */
export class CreateOperatorDto {
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
}
