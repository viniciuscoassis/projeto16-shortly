import { connection } from "../database.js";

const validateAuth = async (req, res, next) => {
  let token = req.headers.authorization;
  if (!token) return res.status(401);
  token = token.replace("Bearer ", "");

  const session = await connection.query(
    "SELECT * FROM sessions WHERE token = $1",
    [token]
  );

  res.locals.session = session.rows[0];
  if (session.rows.length === 0) return res.sendStatus(401);
  next();
};

export default validateAuth;
