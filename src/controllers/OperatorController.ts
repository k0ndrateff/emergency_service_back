import { Controller, Get } from 'routing-controllers';
import 'reflect-metadata';
import {db} from "../config/pgPool";

@Controller()
export class OperatorController {
  @Get('/operators')
  async getAll() {
    try {
      const result = await db.query('SELECT * FROM operator').then();
      return result.rows;
    } catch (err) {
      return err;
    }
  }
}
