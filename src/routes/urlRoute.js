import express from "express";
import validateAuth from "../middlewares/validateAuth.js";
import validateUrl from "../middlewares/validateUrl.js";
import shortenController from "../controllers/shortenController.js";
import getId from "../controllers/getIdController.js";
import { connection } from "../database.js";
import verifyShort from "../middlewares/verifyShortUrl.js";

const urlRoute = express.Router();

urlRoute.get("/urls/:id", getId);
urlRoute.get("/urls/open/:shortUrl", verifyShort, async (req, res) => {
  const urlInfo = res.locals.urlInfo;
  try {
    const newVisit = Number(urlInfo.visitsCount) + 1;

    await connection.query('UPDATE urls SET "visitsCount" = $1 WHERE id = $2', [
      newVisit,
      urlInfo.id,
    ]);

    return res.redirect(`${urlInfo.url}`);
  } catch (e) {
    return res.status(500).send(e);
  }
});

urlRoute.use(validateAuth);
urlRoute.post("/urls/shorten", validateUrl, shortenController);

export default urlRoute;
