import { nanoid } from "nanoid";
import { connection } from "../database.js";

const shortenController = async (req, res) => {
  const url = res.locals.url;
  const session = res.locals.session;
  const shortUrl = nanoid();

  await connection.query(
    'INSERT INTO urls ("creatorId", url,"shortUrl") VALUES ($1,$2,$3)',
    [session.userId, url, shortUrl]
  );

  return res.status(201).send({ shortUrl });
};

export default shortenController;
