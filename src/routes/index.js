import express from "express";
import authRoute from "./authRoutes.js";
import urlRoute from "./shortenRoute.js";

const Routes = express.Router();

Routes.use(authRoute);
Routes.use(urlRoute);

export default Routes;
