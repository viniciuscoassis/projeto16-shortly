import { connection } from "../database.js";
import bcrypt from "bcrypt";
import { v4 as uuid } from "uuid";

const signUpFunction = async (req, res) => {
  const { name, email, password } = req.body;

  await connection.query(
    "INSERT INTO users (name, email, password) VALUES ($1,$2,$3)",
    [name, email, bcrypt.hashSync(password, 10)]
  );

  return res.sendStatus(201);
};

const signInFunction = async (req, res) => {
  const user = res.locals.user;

  const token = uuid();

  await connection.query(
    'INSERT INTO sessions (token,"userId") VALUES ($1,$2)',
    [token, user.id]
  );

  return res.status(200).send({ token });
};

export { signUpFunction, signInFunction };
