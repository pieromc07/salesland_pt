import { Router } from "express";
import { altaLead, moverLead } from "../controller/LeadController.js";

const router = Router();

router.get("/ping", (req, res) => {
  res.json({ message: "pong" });
});

router.post("/ws_salesland_leads/altaLead", altaLead);


export default router;