import express from "express";
import fetchRank from "../controllers/rankingController.js";

const rankingRoute = express.Router();

rankingRoute.get("/ranking", fetchRank);

export default rankingRoute;
