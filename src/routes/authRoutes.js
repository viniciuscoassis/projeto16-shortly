import express from "express";
import { signUpFunction } from "../controllers/authControllers.js";
import validateNewUser from "../middlewares/newUserValidation.js";

const authRoute = express.Router();

authRoute.post("/signup", validateNewUser, signUpFunction);

export default authRoute;
