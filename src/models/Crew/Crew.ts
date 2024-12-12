import {CrewType} from "./CrewType";
import {CrewStatus} from "./CrewStatus";

export class Crew {
  id: number;
  type: CrewType;
  status: CrewStatus;
  size: number;
  officer_phone: string;
  base_address: string;
  current_lat: number | null;
  current_lon: number | null;
}
