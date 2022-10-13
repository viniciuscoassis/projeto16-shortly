import isValidUrl from "../regex/isValidUrl.js";

const validateUrl = (req, res, next) => {
  const { url } = req.body;
  res.locals.url = url;
  if (!isValidUrl(url))
    return res.status(422).send("campo enviado não é uma url válida");

  next();
};

export default validateUrl;
