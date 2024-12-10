import {Incident} from "./Incident";

export class IncidentGeoCoded extends Incident {
  address_geo?: {
    lat: number;
    lon: number;
  }
}
