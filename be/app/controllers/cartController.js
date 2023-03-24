const cartModel = require("../models/cartModel");
const helper = require("../helpers/printHelper");

exports.findAll = (req, res) => {
  const id = req.auth.id;
  const { page, perPage } = req.query;
  const sortBy = req.query.sortBy ? req.query.sortBy : "bag.id";
  const order = req.query.order ? req.query.order : "ASC";

  cartModel
    .getAllCart(page, perPage, sortBy, order, id)
    .then(([totalData, totalPage, result, page, perPage]) => {
      if (result < 1) {
        helper.printError(res, 400, "Cart not found");
        return;
      }
      helper.printPaginate(
        res,
        200,
        "Find all cart successfully",
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

exports.create = (req, res) => {
  const {
    idProduct,
    idUser,
    idStore,
    size,
    color,
    qty,
    price,
    total,
  } = req.body;

  const data = {
    idProduct,
    idUser,
    idStore,
    size,
    color,
    qty,
    price,
    total,
  };

  cartModel
    .createCart(data)
    .then((result) => {
      if (result.affectedRows === 0) {
        helper.printError(res, 400, "Error creating cart");
        return;
      }
      delete result[0].createdAt;
      delete result[0].updatedAt;
      helper.printSuccess(res, 200, "Cart has been created", result);
    })
    .catch((err) => {
      helper.printError(res, 500, err.message);
    });
};

exports.update = (req, res) => {
  const id = req.params.id;

  const qty = req.body.qty;
  const price = req.body.price;

  cartModel
    .updateCart(id, qty, price)
    .then((result) => {
      console.log(result);
      if (result.length < 1) {
        helper.printError(res, 400, "Error updating cart");
        return;
      }
      delete result[0].createdAt;
      delete result[0].updatedAt;
      helper.printSuccess(res, 200, "Cart has been updated", result);
    })
    .catch((err) => {
      helper.printError(res, 500, err.message);
    });
};

exports.delete = async (req, res) => {
  const idUser = req.auth.id;
  const cart = req.body.cart;

  try {
    for (let i = 0; i < cart.length; i++) {
      const result = await cartModel.deleteCart(cart[i], idUser);
      if (result.affectedRows === 0) {
        helper.printError(res, 400, "Error deleting cart");
        return;
      }
    }
    helper.printSuccess(res, 200, "Cart has been deleted", {});
  } catch (err) {
    helper.printError(res, 500, err.message);
  }
};

exports.count = (req, res) => {
  const id = req.auth.id;

  cartModel
    .getCountCart(id)
    .then((result) => {
      if (result[0].totalCart === 0) {
        helper.printError(res, 400, "Cart not found");
        return;
      }
      helper.printSuccess(res, 200, "Count cart successfully", result);
    })
    .catch((err) => {
      helper.printError(res, 500, err.message);
    });
};
