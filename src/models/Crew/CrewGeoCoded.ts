import {Crew} from "./Crew";

export class CrewGeoCoded extends Crew {
  base_geo?: {
    lat: number;
    lon: number;
  }
}
