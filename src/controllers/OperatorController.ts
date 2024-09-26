import { Controller, Get } from 'routing-controllers';
import 'reflect-metadata';
import {pool} from "../config/pgPool";
import {Operator} from "../models/Operator";

@Controller()
export class OperatorController {
  @Get('/operators')
  async getAll(): Promise<Operator[]> {
    try {
      const result = await pool.query('SELECT * FROM operator');

      return result.rows;
    } catch (err) {
      throw new Error(`Failed to get all operators: ${err}`);
    }
  }
}
