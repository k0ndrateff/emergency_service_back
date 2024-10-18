import {Body, Get, JsonController, OnNull, OnUndefined, Param, Patch} from 'routing-controllers';
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

  @Get('/:id')
  @OnUndefined(404)
  async getOne(@Param('id') id: string): Promise<Incident> {
    try {
      const result = await pool.query('SELECT * FROM incident WHERE id = $1', [id]);

      return result.rows[0];
    }
    catch (err) {
      throw new Error(`Failed to get incident: ${err}`);
    }
  }

  @Patch('/:id')
  @OnNull(400)
  @OnUndefined(200)
  async update(@Param('id') id: string, @Body() incident: Partial<Incident>): Promise<void | null> {
    try {
      const keys = Object.keys(incident);
      const values = Object.values(incident);

      if (!keys.length || !values.length) return null;

      const setClause = keys.map((key, index) => `${key} = $${index + 1}`).join(', ');

      const query = `UPDATE incident SET ${setClause} WHERE id = $${keys.length + 1}`;

      values.push(Number(id));

      await pool.query(query, values);
    }
    catch (err) {
      throw new Error(`Failed to update incident: ${err}`);
    }
  }
}
