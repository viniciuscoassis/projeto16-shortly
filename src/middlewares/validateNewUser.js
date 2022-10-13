import { connection } from "../database.js";
import newUserSchema from "../schemas/newUserSchema.js";

const validateNewUser = async (req, res, next) => {
  const { name, email, password, confirmPassword } = req.body;

  const { error, value } = newUserSchema.validate(
    { name, email, password, confirmPassword },
    { abortEarly: false }
  );
  if (error)
    return res.status(422).send(error.details.map((value) => value.message));

  if (password != confirmPassword)
    return res.status(400).send("Senhas não coincidem");

  const exists = await connection.query(
    "SELECT * FROM users WHERE users.email=$1",
    [email]
  );
  if (exists.rows.length > 0)
    return res.status(409).send("Este email já está em uso");

  next();
};

export default validateNewUser;
