const Joi = require("joi");

module.exports = {
  validationSeller: (users) => {
    const schema = Joi.object({
      name: Joi.string().required(),
      email: Joi.string().email().required(),
      phoneNumber: Joi.number().required(),
      password: Joi.string().min(8).required().strict(),
      store: Joi.string().required(),
      isSeller: Joi.boolean().required(),
    });
    return schema.validate(users);
  },
  validationCustomer: (users) => {
    const schema = Joi.object({
      name: Joi.string().required(),
      email: Joi.string().email().required(),
      password: Joi.string().min(8).required().strict(),
      isSeller: Joi.boolean().required(),
    });
    return schema.validate(users);
  },
  validationUpdate: (users) => {
    const schema = Joi.object({
      name: Joi.string().required(),
      email: Joi.string().email().required(),
      phoneNumber: Joi.number().required(),
      gender: Joi.string().required(),
      dateOfBirth: Joi.date().required(),
    });
    return schema.validate(users);
  },
  validationLogin: (users) => {
    const schema = Joi.object({
      email: Joi.string().email().required(),
      password: Joi.string().min(8).required().strict(),
      isSeller: Joi.boolean().required(),
    });
    return schema.validate(users);
  },
  validationEmail: (users) => {
    const schema = Joi.object({
      email: Joi.string().email().required(),
    });
    return schema.validate(users);
  },
  validationPassword: (users) => {
    const schema = Joi.object({
      password: Joi.string().min(8).required().strict(),
      confirmPassword: Joi.string()
        .valid(Joi.ref("password"))
        .required()
        .strict(),
    });
    return schema.validate(users);
  },
  validationUpdateStore: (users) => {
    const schema = Joi.object({
      storeName: Joi.string().required(),
      email: Joi.string().email().required(),
      phoneNumber: Joi.number().required(),
      description: Joi.string().required(),
    });
    return schema.validate(users);
  },
};
