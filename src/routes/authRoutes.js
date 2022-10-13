import express from "express";
import {
  signInFunction,
  signUpFunction,
} from "../controllers/authControllers.js";
import validateNewUser from "../middlewares/newUserValidation.js";
import validateUser from "../middlewares/userLogginValidation.js";

const authRoute = express.Router();

authRoute.post("/signup", validateNewUser, signUpFunction);
authRoute.post("/signin", validateUser, signInFunction);

export default authRoute;
