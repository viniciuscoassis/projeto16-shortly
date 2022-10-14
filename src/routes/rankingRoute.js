import express from "express";
import { connection } from "../database.js";

const rankingRoute = express.Router();

rankingRoute.get("/ranking", async (req, res) => {
  const rank = await connection.query(
    'SELECT users.id, users.name, COUNT("shortUrl") AS linkCount, SUM("visitsCount") AS visitsCount FROM users JOIN urls ON users.id = urls."creatorId" GROUP BY users.id ORDER BY visitsCount DESC LIMIT 10;'
  );

  return res.send(rank.rows);
});

export default rankingRoute;
