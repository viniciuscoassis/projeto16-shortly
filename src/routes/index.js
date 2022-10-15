import express from "express";
import authRoute from "./authRoutes.js";
import rankingRoute from "./rankingRoute.js";
import urlRoute from "./urlRoute.js";
import userRoute from "./userRoute.js";

const Routes = express.Router();

Routes.get("/status", (req, res) => {
  return res.send("OLa");
});
Routes.use(authRoute);
Routes.use(rankingRoute);
Routes.use(urlRoute);
Routes.use(userRoute);

export default Routes;
