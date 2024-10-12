import dotenv from "dotenv";
import * as process from "node:process";
import { createExpressServer } from 'routing-controllers';
import { OperatorController } from './controllers/OperatorController';
import {IncidentController} from "./controllers/IncidentController";
import {CrewController} from "./controllers/CrewController";

dotenv.config();

const port = process.env.PORT || 3001;

const app = createExpressServer({
  controllers: [OperatorController, IncidentController, CrewController],
  cors: true
});

app.listen(port, () => console.log(`Running on port ${port}`));
