import express from "express";
import validateAuth from "../middlewares/validateAuth.js";
import validateUrl from "../middlewares/validateUrl.js";
import { nanoid } from "nanoid";

const urlRoute = express.Router();

urlRoute.use(validateAuth);

urlRoute.post("/urls/shorten", validateUrl, async (req, res) => {
  const short = nanoid();
  return res.send(short);
});

export default urlRoute;
