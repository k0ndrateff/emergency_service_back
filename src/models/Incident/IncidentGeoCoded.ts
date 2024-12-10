import {Incident} from "./Incident";
import {Geolocation} from "../Geolocation";

export class IncidentGeoCoded extends Incident {
  address_geo?: Geolocation;
}
