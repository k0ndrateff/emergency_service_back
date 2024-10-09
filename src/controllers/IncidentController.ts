import {Get, JsonController} from 'routing-controllers';
import 'reflect-metadata';
import {pool} from "../config/pgPool";
import {Incident} from "../models/Incident/Incident";

@JsonController('/incidents')
export class IncidentController {
  @Get()
  async getAll(): Promise<Incident[]> {
    try {
      const result = await pool.query('SELECT * FROM incident');

      return result.rows;
    } catch (err) {
      throw new Error(`Failed to get all incidents: ${err}`);
    }
  }
}
