import express from "express";
import validateAuth from "../middlewares/validateAuth.js";
import validateUrl from "../middlewares/validateUrl.js";
import shortenController from "../controllers/shortenController.js";
import getId from "../controllers/getIdController.js";

import verifyShort from "../middlewares/verifyShortUrl.js";
import redirectUrl from "../controllers/redirectUrl.js";
import verificationBeforeDelete from "../middlewares/verifyBeforeDelete.js";
import deleteUrl from "../controllers/deleteController.js";

const urlRoute = express.Router();

urlRoute.get("/urls/:id", getId);
urlRoute.get("/urls/open/:shortUrl", verifyShort, redirectUrl);

urlRoute.use(validateAuth); // necessita de login

urlRoute.post("/urls/shorten", validateUrl, shortenController);
urlRoute.delete("/urls/:id", verificationBeforeDelete, deleteUrl);

export default urlRoute;
