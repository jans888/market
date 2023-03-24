const addressModel = require("../models/addressModel");
const helper = require("../helpers/printHelper");

exports.findAll = (req, res) => {
  const idUser = req.auth.id;
  const { page, perPage } = req.query;
  const sortBy = req.query.sortBy ? req.query.sortBy : "isPrimary";
  const order = req.query.order ? req.query.order : "DESC";

  addressModel
    .getAllAddress(page, perPage, sortBy, order, idUser)
    .then(([totalData, totalPage, result, page, perPage]) => {
      if (result < 1) {
        helper.printError(res, 400, "Address not found");
        return;
      }
      for (let i = 0; i < perPage; i++) {
        if (result[i] === undefined) {
          break;
        } else {
          delete result[i].createdAt;
          delete result[i].updatedAt;
        }
      }
      helper.printPaginate(
        res,
        200,
        "Find all address successfully",
        totalData,
        totalPage,
        result,
        page,
        perPage
      );
    })
    .catch((err) => {
      helper.printError(res, 500, err.message);
    });
};

exports.findOne = (req, res) => {
  const id = req.auth.id;

  addressModel
    .getAddressById(id)
    .then((result) => {
      if (result < 1) {
        helper.printError(res, 400, `Cannot find one address with id = ${id}`);
        return;
      }
      delete result[0].createdAt;
      delete result[0].updatedAt;
      helper.printSuccess(res, 200, "Find one address successfully", result);
    })
    .catch((err) => {
      helper.printError(res, 500, err.message);
    });
};

exports.insertAddress = (req, res) => {
  const idUser = req.auth.id;

  const { type, address, postalCode, city, name, phoneNumber, isPrimary } =
    req.body;

  const data = {
    idUser,
    type,
    address,
    postalCode,
    city,
    name,
    phoneNumber,
    isPrimary: isPrimary === true || isPrimary === "true" ? true : false,
  };

  addressModel
    .insertAddress(data)
    .then((result) => {
      for (let i = 0; i < result.length; i++) {
        if (result[i] === undefined) {
          break;
        } else {
          delete result[i].createdAt;
          delete result[i].updatedAt;
        }
      }
      helper.printSuccess(
        res,
        200,
        `Address for ${result[0].name} successfully inserted`,
        result
      );
    })
    .catch((err) => {
      helper.printError(res, 500, err.message);
    });
};

exports.updateAddress = (req, res) => {
  const idAddress = req.params.id;
  const idUser = req.auth.id;

  const { name, isPrimary } = req.body;

  addressModel
    .updateAddress(
      idAddress,
      isPrimary === true || isPrimary === "true" ? true : false,
      idUser
    )
    .then((result) => {
      if (result.length < 1) {
        helper.printError(
          res,
          400,
          `Cannot update address with id = ${idAddress}`
        );
        return;
      }
      delete result[0].createdAt;
      delete result[0].updatedAt;
      helper.printSuccess(
        res,
        200,
        `Address for ${name} successfully updated`,
        result
      );
    })
    .catch((err) => {
      if (err.message === "Internal server error") {
        helper.printError(res, 500, err.message);
      }
      helper.printError(res, 400, err.message);
    });
};

exports.deleteAddress = async (req, res) => {
  const idUser = req.auth.id;
  const idAddress = req.params.id;

  try {
    const result = await addressModel.deleteAddress(idUser, idAddress);
    if (result.affectedRows === 0) {
      helper.printError(
        res,
        400,
        `Error deleting address with id = ${idAddress}`
      );
      return;
    }
    helper.printSuccess(res, 200, "Delete address successfully", {});
  } catch (err) {
    helper.printError(res, 500, err.message);
  }
};
