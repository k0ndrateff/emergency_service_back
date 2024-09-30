import dotenv from "dotenv";
import * as process from "node:process";
import { createExpressServer } from 'routing-controllers';
import { OperatorController } from './controllers/OperatorController';

dotenv.config();

const port = process.env.PORT || 3001;

const app = createExpressServer({
  controllers: [OperatorController],
  cors: true
});

app.listen(port, () => console.log(`Running on port ${port}`));
