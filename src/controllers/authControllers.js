import { connection } from "../database.js";
import bcrypt from "bcrypt";

const signUpFunction = async (req, res) => {
  const { name, email, password, confirmPassword } = req.body;

  await connection.query(
    "INSERT INTO users (name, email, password) VALUES ($1,$2,$3)",
    [name, email, bcrypt.hashSync(password, 10)]
  );

  return res.sendStatus(201);
};

export { signUpFunction };
