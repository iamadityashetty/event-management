const joi = require("@hapi/joi");

const userSchema = joi.object({
  // f_name: joi.string().regex(/^[a-zA-Z ]+$/),
  // l_name: joi.string().regex(/^[a-zA-Z ]+$/),
  email: joi.string().email({ minDomainSegments: 2, tlds: false }),
  // phone_number: joi.string().pattern(/^[0-9]+$/, { name: "numbers" }),
  // gender: joi.string().valid("male", "female"),
});

module.exports.validateUser = (user) => {
  return userSchema.validate(user);
};
