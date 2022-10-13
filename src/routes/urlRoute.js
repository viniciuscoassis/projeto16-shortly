import express from "express";
import validateAuth from "../middlewares/validateAuth.js";
import validateUrl from "../middlewares/validateUrl.js";
import shortenController from "../controllers/shortenController.js";

const urlRoute = express.Router();

urlRoute.get("/urls/:id", (req, res) => {
  const { id } = req.params;
  res.send(id);
});

urlRoute.use(validateAuth);
urlRoute.post("/urls/shorten", validateUrl, shortenController);

export default urlRoute;
