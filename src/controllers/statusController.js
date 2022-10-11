import { connection } from "../database.js";

const statusFunction = async (req, res) => {
  const names = await connection.query("SELECT * FROM users;");
  res.send(names.rows);
};

export default statusFunction;
