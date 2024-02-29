
import dotenv from 'dotenv';
dotenv.config();
import cron from 'node-cron';
import express from 'express';
import router from './routes/router.js';
import { recargar } from './service/LeadService.js';

const app = express();

app.use(express.json());
app.use("/api", router);

await recargar();

app.listen(process.env.HOST, () => {
  console.log('Server is running on port', process.env.HOST);
});