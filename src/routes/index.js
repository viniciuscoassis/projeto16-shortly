import express from "express";
import authRoute from "./authRoutes.js";
import urlRoute from "./urlRoute.js";
import userRoute from "./userRoute.js";

const Routes = express.Router();

Routes.use(authRoute);
Routes.use(urlRoute);
Routes.use(userRoute);

export default Routes;
