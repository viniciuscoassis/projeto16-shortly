import express from "express";
import sendUserInfo from "../controllers/sendUserController.js";

import fetchUserInfo from "../middlewares/fetchUserInfo.js";
import validateAuth from "../middlewares/validateAuth.js";

const userRoute = express.Router();

userRoute.use(validateAuth);
userRoute.get("/users/me", fetchUserInfo, sendUserInfo);

export default userRoute;
