import express from "express";
import validateAuth from "../middlewares/validateAuth.js";
import validateUrl from "../middlewares/validateUrl.js";
import shortenController from "../controllers/shortenController.js";
import { connection } from "../database.js";

const urlRoute = express.Router();

urlRoute.get("/urls/:id", async (req, res) => {
  const { id } = req.params;

  const idUrl = await connection.query(
    'SELECT id,"shortUrl",url FROM urls WHERE id = $1',
    [id]
  );
  if (idUrl.rows.length == 0) return res.sendStatus(404);

  res.send(idUrl.rows[0]);
});

urlRoute.use(validateAuth);
urlRoute.post("/urls/shorten", validateUrl, shortenController);

export default urlRoute;
