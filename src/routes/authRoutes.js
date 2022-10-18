import express from "express";
import {
  signInFunction,
  signUpFunction,
} from "../controllers/authControllers.js";
import validateNewUser from "../middlewares/validateNewUser.js";
import validateUser from "../middlewares/validateUser.js";

const authRoute = express.Router();

authRoute.post("/signup", validateNewUser, signUpFunction);
authRoute.post("/signin", validateUser, signInFunction);

authRoute.delete("/logout", (req, res) => {});

export default authRoute;
