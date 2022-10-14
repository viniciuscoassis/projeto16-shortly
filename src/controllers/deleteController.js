const deleteUrl = async (req, res) => {
  const { id } = req.params;
  await connection.query("DELETE FROM urls WHERE id = $1", [id]);

  return res.sendStatus(204);
};
export default deleteUrl;
