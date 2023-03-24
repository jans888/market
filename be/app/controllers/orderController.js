const helper = require("../helpers/printHelper");
const orderModel = require("../models/orderModel");
const cartModel = require("../models/cartModel");

exports.findAll = (req, res) => {
  const id = req.auth.id;
  const { page, perPage } = req.query;
  const status = req.query.status ? req.query.status : "";
  const sortBy = req.query.sortBy ? req.query.sortBy : "transaction.id";
  const order = req.query.order ? req.query.order : "DESC";

  orderModel
    .getAllOrderUser(page, perPage, sortBy, order, id, status)
    .then(([totalData, totalPage, result, page, perPage]) => {
      if (result < 1) {
        helper.printError(res, 400, "Order not found");
        return;
      }
      helper.printPaginate(
        res,
        200,
        "Find all order successfully",
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

exports.findAllDetail = (req, res) => {
  const id = req.params.id;
  const { page, perPage } = req.query;
  const sortBy = req.query.sortBy ? req.query.sortBy : "detail_transaction.id";
  const order = req.query.order ? req.query.order : "ASC";

  orderModel
    .getAllDetailOrderUser(page, perPage, sortBy, order, id)
    .then(([totalData, totalPage, result, page, perPage]) => {
      if (result < 1) {
        helper.printError(res, 400, `Cannot find order detail with id = ${id}`);
        return;
      }
      helper.printPaginate(
        res,
        200,
        "Find order detail successfully",
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
  const idUser = req.auth.id;
  const { cart, address, subTotal, postage, paymentMethod } = req.body;

  const data = {
    idUser,
    idStore: cart[0].idStore,
    address,
    subTotal,
    postage,
    total: subTotal + postage,
    paymentMethod,
    status: "Not yet paid",
  };

  orderModel
    .createOrder(data)
    .then((result) => {
      if (result.affectedRows === 0) {
        helper.printError(res, 400, "Error creating order");
        return;
      }
      delete result[0].createdAt;
      delete result[0].updatedAt;
      const idTransaction = result[0].id;

      cart.map(async (item, index) => {
        const dataOrderDetail = {
          idUser,
          idTransaction,
          idProduct: item.idProduct,
          size: item.size,
          color: item.color,
          qty: item.qty,
        };
        await orderModel.createOrderDetail(dataOrderDetail);
      });

      cart.map(async (item, index) => {
        await cartModel.deleteCart(item.id, idUser);
      });

      cart.map(async (item, index) => {
        await orderModel.updateStock(item.qty, item.idProduct);
      });

      helper.printSuccess(res, 200, "Order has been created", result);
    })
    .catch((err) => {
      helper.printError(res, 500, err.message);
    });
};

exports.delete = (req, res) => {
  const id = req.params.id;

  orderModel
    .delete(id)
    .then((result) => {
      if (result.affectedRows === 0) {
        helper.printError(res, 400, `Cannot delete order with id = ${id}`);
        return;
      }
      helper.printSuccess(res, 200, "Order has been deleted", {});
    })
    .catch((err) => {
      helper.printError(res, 500, err.message);
    });
};
