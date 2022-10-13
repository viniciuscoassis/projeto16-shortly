import Joi from "joi";
import { connection } from "../database.js";
import bcrypt from "bcrypt";

const loginSchema = Joi.object({
  email: Joi.string().required(),
  password: Joi.string().required(),
});

const validateUser = async (req, res, next) => {
  const { email, password } = req.body;

  const { erro, value } = loginSchema.validate(
    { email, password },
    { abortEarly: false }
  );

  if (erro)
    return res.status(422).send(erro.details.map((value) => value.message));

  const userLogging = await connection.query(
    "SELECT * FROM users WHERE email = $1",
    [email]
  );

  if (userLogging.rows.length === 0)
    return res.status(422).send("Este email não está cadastrado");

  if (!bcrypt.compareSync(password, userLogging.rows[0].password))
    return res.status(401).send("Email ou senha incorretos");

  res.locals.user = userLogging.rows[0];

  next();
};

export default validateUser;
