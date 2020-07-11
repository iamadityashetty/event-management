const jwt = require("jsonwebtoken");
const config = require("config");
const jwtPrivateKey = config.get("jwtPrivateKey");

// Returns a JWT-Signed token with payload passed by the user and the Private Key used for hashing - Eli
module.exports.generateToken = (payload) => {
  return jwt.sign(payload, jwtPrivateKey);
};
