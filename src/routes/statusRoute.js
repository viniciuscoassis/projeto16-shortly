import express from "express";
import statusFunction from "../controllers/statusController.js";

const statusRoute = express.Router();

statusRoute.get("/status", statusFunction);

export default statusRoute;
