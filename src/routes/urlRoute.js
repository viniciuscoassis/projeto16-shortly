import express from "express";
import validateAuth from "../middlewares/validateAuth.js";
import validateUrl from "../middlewares/validateUrl.js";
import shortenController from "../controllers/shortenController.js";
import getId from "../controllers/getIdController.js";
import { connection } from "../database.js";

const urlRoute = express.Router();

urlRoute.get("/urls/:id", getId);
urlRoute.get("/urls/open/:shortUrl", async (req, res) => {
  const { shortUrl } = req.params;

  try {
    const urlInfo = await connection.query(
      'SELECT * FROM urls WHERE "shortUrl" = $1',
      [shortUrl]
    );
    const newVisit = Number(urlInfo.rows[0].visitsCount) + 1;

    await connection.query('UPDATE urls SET "visitsCount"=$1 WHERE id = $2', [
      newVisit,
      urlInfo.rows[0].id,
    ]);

    return res.redirect(`${urlInfo.rows[0].url}`);
  } catch (error) {
    res.status(500).send(error);
  }
});

urlRoute.use(validateAuth);
urlRoute.post("/urls/shorten", validateUrl, shortenController);

export default urlRoute;
