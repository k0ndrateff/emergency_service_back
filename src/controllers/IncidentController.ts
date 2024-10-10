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

  @Get("/active")
  async getActive(): Promise<Incident[]> {
    try {
      const result = await pool.query('SELECT * FROM incident WHERE status = 1 ORDER BY priority');

      return result.rows;
    } catch (err) {
      throw new Error(`Failed to get active incidents: ${err}`);
    }
  }

  @Get("/previous")
  async getPrevious(): Promise<Incident[]> {
    try {
      const result = await pool.query('SELECT * FROM incident WHERE end_time IS NOT NULL ORDER BY end_time');

      return result.rows;
    } catch (err) {
      throw new Error(`Failed to get previous incidents: ${err}`);
    }
  }
}
