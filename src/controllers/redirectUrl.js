import { connection } from "../database.js";

const redirectUrl = async (req, res) => {
  const urlInfo = res.locals.urlInfo;
  try {
    const newVisit = Number(urlInfo.visitsCount) + 1;

    await connection.query('UPDATE urls SET "visitsCount" = $1 WHERE id = $2', [
      newVisit,
      urlInfo.id,
    ]);

    return res.redirect(`${urlInfo.url}`);
  } catch (e) {
    return res.status(500).send(e);
  }
};
export default redirectUrl;
