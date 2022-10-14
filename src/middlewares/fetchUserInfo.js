import { connection } from "../database.js";

const fetchUserInfo = async (req, res, next) => {
  const session = res.locals.session;

  let userInfo = await connection.query(
    'SELECT users.id, users.name, SUM(urls."visitsCount") AS "visitCount" FROM users JOIN urls ON users.id = urls."creatorId" WHERE users.id = $1 GROUP BY users.id;',
    [session.userId]
  );

  if (userInfo.rows[0] === undefined) {
    let checkLinks = await connection.query(
      "SELECT users.id,users.name FROM users WHERE id = $1",
      [session.id]
    );
    checkLinks.rows[0].shortenedUrls = "Você não tem urls encurtadas";
    return res.status(400).send(checkLinks.rows[0]);
  }

  const urlUser = await connection.query(
    'SELECT urls.id, urls."shortUrl", urls.url, urls."visitsCount" FROM urls WHERE "creatorId"=$1',
    [session.userId]
  );

  userInfo = userInfo.rows[0];
  userInfo.shortenedUrls = urlUser.rows;
  res.locals.userInfo = userInfo;
  next();
};
export default fetchUserInfo;
