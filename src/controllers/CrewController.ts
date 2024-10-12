import {Get, JsonController} from "routing-controllers";
import "reflect-metadata";
import {pool} from "../config/pgPool";
import {Crew} from "../models/Crew/Crew";
import {CrewGeoCoded} from "../models/Crew/CrewGeoCoded";
import {dadataApi} from "../external/dadataApi";

@JsonController('/crews')
export class CrewController {
  @Get()
  async getAll(): Promise<Crew[]> {
    try {
      const result = await pool.query('SELECT * FROM crew');

      return result.rows;
    } catch (err) {
      throw new Error(`Failed to get all crews: ${err}`);
    }
  }

  @Get('/geo')
  async getAllGeoCoded(): Promise<CrewGeoCoded[]> {
    const crews = await this.getAll();

    for (const crew of crews) {
      (crew as CrewGeoCoded).base_geo = await dadataApi.geoCode(crew.base_address);
    }

    return crews;
  }
}
