const jwt = require("jsonwebtoken");
const moment = require("moment");
const ip = require("ip");
const path = require("path");
const fs = require("fs");
const usersModel = require("../models/usersModel");
const helper = require("../helpers/printHelper");
const mail = require("../helpers/sendEmail");
const hash = require("../helpers/hashPassword");
const validation = require("../helpers/validation");
const secretKey = process.env.SECRET_KEY;
moment.locale("id");

exports.findOne = (req, res) => {
  const id = req.auth.id;

  usersModel
    .getUsersById(id)
    .then((result) => {
      if (result < 1) {
        helper.printError(res, 400, `Cannot find one users with id = ${id}`);
        return;
      }
      delete result[0].password;
      delete result[0].active;
      delete result[0].createdAt;
      delete result[0].updatedAt;
      helper.printSuccess(res, 200, "Find one users successfully", result);
    })
    .catch((err) => {
      helper.printError(res, 500, err.message);
    });
};

exports.create = async (req, res) => {
  let image;
  if (!req.file) {
    image = "images\\default.png";
  } else {
    image = req.file.path;
  }

  const { name, email, phoneNumber, password } = req.body;
  const store = req.body.store;
  const isSeller = req.body.isSeller;

  let validate;
  let data;
  if (isSeller === "true" || isSeller === true) {
    validate = validation.validationSeller(req.body);
    data = {
      name,
      email,
      phoneNumber,
      password: await hash.hashPassword(password),
      gender: "Not defined",
      dateOfBirth: "None",
      image,
      active: false,
      role: 1,
    };
  } else {
    validate = validation.validationCustomer({
      name,
      email,
      password,
      isSeller,
    });
    data = {
      name,
      email,
      phoneNumber: "None",
      password: await hash.hashPassword(password),
      gender: "Not defined",
      dateOfBirth: "None",
      image,
      active: false,
      role: 2,
    };
  }
  if (validate.error) {
    helper.printError(res, 400, validate.error.details[0].message);
    return;
  }

  if (isSeller === "true" || isSeller === true) {
    try {
      const checkStore = await usersModel.checkStore(store);
      if (checkStore.length > 0) {
        helper.printError(res, 400, "Store name is already in use");
        return;
      }
    } catch (err) {
      helper.printError(res, 500, err.message);
      return;
    }
  }

  usersModel
    .createUsers(data, isSeller)
    .then(async (result) => {
      if (result.affectedRows === 0) {
        helper.printError(res, 400, "Error creating users");
        return;
      }
      delete result[0].password;
      delete result[0].active;
      delete result[0].createdAt;
      delete result[0].updatedAt;
      const payload = {
        id: result[0].id,
        name: result[0].name,
        email: result[0].email,
        phoneNumber: result[0].phoneNumber,
        gender: result[0].gender,
        dateOfBirth: result[0].dateOfBirth,
        image: result[0].image,
        idAddress: result[0].idAddress,
        role: result[0].role,
      };
      if (isSeller === "true" || isSeller === true) {
        const dataStore = {
          idUser: result[0].id,
          name: store,
          description: "None",
        };
        await usersModel.createStore(dataStore);
      }
      jwt.sign(payload, secretKey, { expiresIn: "24h" }, async (err, token) => {
        const data = {
          email: result[0].email,
          token: token,
        };
        await usersModel.createUsersToken(data);
        await mail.send(result[0].email, token, "verify");
        helper.printSuccess(
          res,
          200,
          "Your account has been created, please check your email to activate your account",
          result
        );
      });
    })
    .catch((err) => {
      if (
        err.message === "Email has been registered" ||
        err.message === "Phone number is already in use"
      ) {
        helper.printError(res, 400, err.message);
      } else {
        helper.printError(res, 500, err.message);
      }
    });
};

exports.verify = async (req, res) => {
  const email = req.query.email;
  const token = req.query.token;

  try {
    const user = await usersModel.findEmail(email);
    if (user < 1) {
      helper.printError(res, 400, "Email is not valid!");
      return;
    } else {
      try {
        const userToken = await usersModel.findToken(token);
        if (userToken < 1) {
          helper.printError(res, 400, "Token is not valid!");
          return;
        } else {
          jwt.verify(token, secretKey, async (err, decoded) => {
            if (err) {
              if (err.name === "JsonWebTokenError") {
                helper.printError(res, 401, "Invalid signature");
              } else if (err.name === "TokenExpiredError") {
                await usersModel.deleteEmail(email);
                await usersModel.deleteToken(email);
                helper.printError(res, 401, "Token is expired");
              } else {
                helper.printError(res, 401, "Token is not active");
              }
            } else {
              await usersModel.setActive(email);
              await usersModel.deleteToken(email);
              helper.printSuccess(
                res,
                200,
                `${email} has been activated, please login!`,
                decoded
              );
            }
          });
        }
      } catch (err) {
        helper.printError(res, 500, err.message);
      }
    }
  } catch (err) {
    helper.printError(res, 500, err.message);
  }
};

exports.login = (req, res) => {
  const validate = validation.validationLogin(req.body);

  if (validate.error) {
    helper.printError(res, 400, validate.error.details[0].message);
    return;
  }

  const { email, password } = req.body;
  const isSeller = req.body.isSeller;

  const data = {
    email,
    password,
  };

  usersModel
    .login(data, isSeller)
    .then((result) => {
      delete result.password;
      delete result.active;
      delete result.createdAt;
      delete result.updatedAt;
      const payload = {
        id: result.id,
        name: result.name,
        email: result.email,
        phoneNumber: result.phoneNumber,
        gender: result.gender,
        dateOfBirth: result.dateOfBirth,
        image: result.image,
        idAddress: result.idAddress,
        role: result.role,
      };
      jwt.sign(payload, secretKey, { expiresIn: "24h" }, async (err, token) => {
        result.token = token;
        const data = {
          idUser: result.id,
          accessToken: token,
          ipAddress: ip.address(),
        };
        await usersModel.createToken(data);
        helper.printSuccess(res, 200, "Login successfully", result);
      });
    })
    .catch((err) => {
      if (
        err.message === "Your email is not registered" ||
        err.message === "Your email is not activated" ||
        err.message === "Wrong password"
      ) {
        helper.printError(res, 400, err.message);
      } else {
        helper.printError(res, 500, err.message);
      }
    });
};

exports.forgotPassword = (req, res) => {
  const validate = validation.validationEmail(req.body);

  if (validate.error) {
    helper.printError(res, 400, validate.error.details[0].message);
    return;
  }

  const email = req.body.email;

  const data = email;

  usersModel
    .findAccount(data)
    .then((result) => {
      delete result[0].password;
      delete result[0].active;
      delete result[0].createdAt;
      delete result[0].updatedAt;
      const payload = {
        id: result[0].id,
        name: result[0].name,
        email: result[0].email,
        phoneNumber: result[0].phoneNumber,
        gender: result[0].gender,
        dateOfBirth: result[0].dateOfBirth,
        image: result[0].image,
        idAddress: result[0].idAddress,
        role: result[0].role,
      };
      jwt.sign(payload, secretKey, { expiresIn: "24h" }, async (err, token) => {
        const data = {
          email: result[0].email,
          token: token,
        };
        await usersModel.updateActive(result[0].id);
        await usersModel.createUsersToken(data);
        await mail.send(result[0].email, token, "forgot");
        helper.printSuccess(
          res,
          200,
          "Please check your email to reset your password!",
          result
        );
      });
    })
    .catch((err) => {
      helper.printError(res, 500, err.message);
    });
};

exports.resetPassword = async (req, res) => {
  const validate = validation.validationPassword(req.body);

  if (validate.error) {
    helper.printError(res, 400, validate.error.details[0].message);
    return;
  }

  const email = req.query.email;
  const token = req.query.token;
  const password = req.body.password;

  try {
    const user = await usersModel.findEmail(email);
    if (user < 1) {
      helper.printError(res, 400, "Reset password failed! Wrong email.");
      return;
    } else {
      try {
        const userToken = await usersModel.findToken(token);
        if (userToken < 1) {
          helper.printError(res, 400, "Reset password failed! Wrong token.");
          return;
        } else {
          jwt.verify(token, secretKey, async (err, decoded) => {
            if (err) {
              if (err.name === "JsonWebTokenError") {
                helper.printError(res, 401, "Invalid signature");
              } else if (err.name === "TokenExpiredError") {
                await usersModel.deleteToken(email);
                helper.printError(res, 401, "Token is expired");
              } else {
                helper.printError(res, 401, "Token is not active");
              }
            } else {
              const data = await hash.hashPassword(password);
              await usersModel.setPassword(data, email);
              await usersModel.deleteToken(email);
              if (!data) {
                helper.printError(res, 400, "Content cannot be empty");
                return;
              }
              helper.printSuccess(
                res,
                200,
                "Password has been changed! Please login.",
                decoded
              );
            }
          });
        }
      } catch (err) {
        helper.printError(res, 500, err.message);
      }
    }
  } catch (err) {
    helper.printError(res, 500, err.message);
  }
};

exports.update = async (req, res) => {
  const validate = validation.validationUpdate(req.body);

  if (validate.error) {
    helper.printError(res, 400, validate.error.details[0].message);
    return;
  }

  const id = req.params.id;

  const { name, email, phoneNumber, gender, dateOfBirth } = req.body;

  const data = {
    name,
    email,
    phoneNumber,
    gender,
    dateOfBirth: moment(dateOfBirth).format("LL"),
  };

  usersModel
    .findUser(id, "update")
    .then((result) => {
      let image;
      if (!req.file) {
        image = result[0].image;
      } else {
        const oldImage = result[0].image;
        if (oldImage !== "images\\default.png") {
          removeImage(oldImage);
        }
        image = req.file.path;
      }
      data.image = image;
      return usersModel.updateUsers(id, data);
    })
    .then((result) => {
      delete result[0].password;
      delete result[0].active;
      delete result[0].createdAt;
      delete result[0].updatedAt;
      helper.printSuccess(res, 200, "Users has been updated", result);
    })
    .catch((err) => {
      if (err.message === "Internal server error") {
        helper.printError(res, 500, err.message);
      }
      helper.printError(res, 400, err.message);
    });
};

const removeImage = (filePath) => {
  filePath = path.join(__dirname, "../..", filePath);
  fs.unlink(filePath, (err) => new Error(err));
};
