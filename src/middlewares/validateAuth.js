import { connection } from "../database.js";

const validateAuth = async (req, res, next) => {
  const token = req.headers.authorization.replace("Bearer ", "");

  const session = await connection.query(
    "SELECT * FROM sessions WHERE token = $1",
    [token]
  );

  if (session.rows.length === 0) return res.sendStatus(401);
  next();
};

export default validateAuth;
