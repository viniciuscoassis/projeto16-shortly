import { connection } from "../database.js";

const verifyShort = async (req, res, next) => {
  const { shortUrl } = req.params;
  const urlInfo = await connection.query(
    'SELECT * FROM urls WHERE "shortUrl" = $1',
    [shortUrl]
  );
  if (urlInfo.rows[0] == undefined) return res.sendStatus(404);
  res.locals.urlInfo = urlInfo.rows[0];
  next();
};

export default verifyShort;
