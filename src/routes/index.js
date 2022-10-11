import express from "express";
import authRoute from "./authRoutes.js";

import statusRoute from "./statusRoute.js";

const Routes = express.Router();

Routes.use(statusRoute);
Routes.use(authRoute);

export default Routes;
