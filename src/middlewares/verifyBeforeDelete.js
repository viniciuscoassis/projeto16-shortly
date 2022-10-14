import { connection } from "../database.js";

const verificationBeforeDelete = async (req, res, next) => {
  const { id } = req.params;
  const session = res.locals.session;

  const url = await connection.query("SELECT * FROM urls WHERE id = $1", [id]);
  if (url.rows[0] === undefined) return res.sendStatus(404);

  if (!(url.rows[0].creatorId === session.userId))
    return res
      .status(401)
      .send("A deleção apenas pode ser feita por quem criou a url");

  next();
};

export default verificationBeforeDelete;
