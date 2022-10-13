import express from "express";
import validateAuth from "../middlewares/validateAuth.js";
import validateUrl from "../middlewares/validateUrl.js";
import shortenController from "../controllers/shortenController.js";
import { connection } from "../database.js";

const urlRoute = express.Router();

urlRoute.get("/urls/:id", async (req, res) => {
  const { id } = req.params;

  const idUrl = await connection.query("SELECT * FROM urls WHERE id = $1", [
    id,
  ]);

  res.send(idUrl.rows[0]);
});

urlRoute.use(validateAuth);
urlRoute.post("/urls/shorten", validateUrl, shortenController);

export default urlRoute;
