import express from "express";
import authRoute from "./authRoutes.js";
import urlRoute from "./urlRoute.js";

const Routes = express.Router();

Routes.use(authRoute);
Routes.use(urlRoute);

export default Routes;
