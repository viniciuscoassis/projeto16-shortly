import express from "express";
import validateAuth from "../middlewares/validateAuth.js";
import isValidUrl from "../regex/isValidUrl.js";

const urlRoute = express.Router();

urlRoute.use(validateAuth);

urlRoute.post("/urls/shorten", async (req, res) => {
  const { url } = req.body;

  if (!isValidUrl(url))
    return res.status(422).send("campo enviado não é uma url válida");
});

export default urlRoute;
