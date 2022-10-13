import { connection } from "../database.js";
const getId = async (req, res) => {
  const { id } = req.params;

  const idUrl = await connection.query(
    'SELECT id,"shortUrl",url FROM urls WHERE id = $1',
    [id]
  );
  if (idUrl.rows.length == 0) return res.sendStatus(404);

  res.send(idUrl.rows[0]);
};

export default getId;
