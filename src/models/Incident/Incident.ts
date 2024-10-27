export class Incident {
  id: number;
  start_time: string;
  end_time: string;
  status: number;
  description: string;
  danger_class: number;
  priority: number;
  id_operator: number;
  services: number[];
  address: string;
}
