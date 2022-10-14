import express from "express";
import authRoute from "./authRoutes.js";
import rankingRoute from "./rankingRoute.js";
import urlRoute from "./urlRoute.js";
import userRoute from "./userRoute.js";

const Routes = express.Router();

Routes.use(authRoute);
Routes.use(urlRoute);
Routes.use(userRoute);
Routes.use(rankingRoute);

export default Routes;
