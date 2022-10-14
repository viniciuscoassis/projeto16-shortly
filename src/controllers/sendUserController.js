const sendUserInfo = async (req, res) => {
  const userInfo = res.locals.userInfo;
  return res.send(userInfo);
};

export default sendUserInfo;
