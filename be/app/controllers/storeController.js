const storeModel = require("../models/storeModel");
const usersModel = require("../models/usersModel");
const helper = require("../helpers/printHelper");
const validation = require("../helpers/validation");
const fs = require("fs");
const path = require("path");

exports.findStore = (req, res) => {
  const id = req.auth.id;

  storeModel
    .findStore(id)
    .then((result) => {
      if (result.length === 0) {
        helper.printError(res, 400, `Cannot find store with idUser = ${id}`);
        return;
      }
      helper.printSuccess(res, 200, "Find one store successfull", result);
    })
    .catch((err) => {
      helper.printError(res, 500, err.message);
    });
};

exports.updateStore = async (req, res) => {
  const id = req.auth.id;

  const { storeName, email, phoneNumber, description } = req.body;

  const dataStore = {
    name: storeName,
    description,
  };
  const dataUser = {
    email,
    phoneNumber,
  };

  try {
    const checkStore = await storeModel.checkStore(id, storeName);
    if (checkStore.length > 0) {
      helper.printError(res, 400, "Store name is already in use");
      return;
    }
  } catch (err) {
    helper.printError(res, 500, err.message);
    return;
  }

  storeModel
    .findStoreUpdate(id, "update")
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
      dataUser.image = image;
      return usersModel.updateUsers(id, dataUser);
    })
    .then((result) => {
      storeModel
        .updateStore(id, dataStore)
        .then((result) => {
          delete result[0].createdAt;
          delete result[0].updatedAt;
          helper.printSuccess(res, 200, "Store has been updated", result);
        })
        .catch((err) => {
          helper.printError(res, 500, err.message);
        });
    })
    .catch((err) => {
      if (err.message === "Internal server error") {
        helper.printError(res, 500, err.message);
      }
      helper.printError(res, 400, err.message);
    });
};

exports.findAllProduct = async (req, res) => {
  const userID = req.auth.id;
  const { page, perPage } = req.query;
  const keyword = req.query.keyword ? req.query.keyword : "";
  const sortBy = req.query.sortBy ? req.query.sortBy : "product.id";
  const order = req.query.order ? req.query.order : "ASC";

  let id;
  try {
    const result = await storeModel.findStore(userID);
    id = result[0].id;
  } catch (err) {
    helper.printError(res, 500, err.message);
  }

  storeModel
    .getAllProduct(id, sortBy, order, page, perPage, keyword)
    .then(([totalData, totalPage, result, page, perPage]) => {
      if (result < 1) {
        helper.printError(res, 400, "Product not found");
        return;
      }
      helper.printPaginate(
        res,
        200,
        "Find all product successfully",
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

exports.findAllProductSold = async (req, res) => {
  const userID = req.auth.id;
  const { page, perPage } = req.query;
  const sortBy = req.query.sortBy ? req.query.sortBy : "product.id";
  const order = req.query.order ? req.query.order : "ASC";

  let id;
  try {
    const result = await storeModel.findStore(userID);
    id = result[0].id;
  } catch (err) {
    helper.printError(res, 500, err.message);
  }

  storeModel
    .getAllProductSold(id, sortBy, order, page, perPage)
    .then(([totalData, totalPage, result, page, perPage]) => {
      if (result < 1) {
        helper.printError(res, 400, "Product sold out not found");
        return;
      }
      helper.printPaginate(
        res,
        200,
        "Find all product sold out successfully",
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

exports.findAllProductArchive = async (req, res) => {
  const userID = req.auth.id;
  const { page, perPage } = req.query;
  const sortBy = req.query.sortBy ? req.query.sortBy : "product.id";
  const order = req.query.order ? req.query.order : "ASC";

  let id;
  try {
    const result = await storeModel.findStore(userID);
    id = result[0].id;
  } catch (err) {
    helper.printError(res, 500, err.message);
  }

  storeModel
    .getAllProductArchive(id, sortBy, order, page, perPage)
    .then(([totalData, totalPage, result, page, perPage]) => {
      if (result < 1) {
        helper.printError(res, 400, "Product archive not found");
        return;
      }
      helper.printPaginate(
        res,
        200,
        "Find all product archive successfully",
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

exports.createProduct = async (req, res) => {
  const image = req.files;
  const id = req.auth.id;
  const {
    title,
    idCategory,
    price,
    conditions,
    description,
    stock,
    size,
    color,
  } = req.body;

  const resultStore = await storeModel.findStore(id);
  if (resultStore < 1) {
    helper.printError(res, 400, "Store not found");
    return;
  }
  const idStore = resultStore[0].id;
  const data = {
    title,
    idCategory,
    idStore,
    image: image[0].path,
    price,
    conditions,
    description,
    size,
    color,
    stock,
    rating: 0,
    isPopular: 0,
    isArchived: 0,
  };
  const resultProduct = await storeModel.findProduct(idStore, title);
  if (resultProduct[0].totalProduct > 0) {
    helper.printError(
      res,
      400,
      "This product already exist, please input another product / new product name"
    );
    return;
  }

  storeModel
    .insertProduct(data)
    .then((result) => {
      const idProduct = result[0].id;
      image.map(async (item, index) => {
        const dataGallery = {
          idProduct,
          image: item.path,
        };
        await storeModel.insertGallery(dataGallery);
      });
      delete result[0].createdAt;
      delete result[0].updatedAt;
      helper.printSuccess(res, 200, "New product has been created", result);
    })
    .catch((err) => {
      helper.printError(res, 500, err.message);
    });
};

exports.findAllOrder = async (req, res) => {
  const userID = req.auth.id;
  const { page, perPage } = req.query;
  const keyword = req.query.keyword ? req.query.keyword : "";
  const status = req.query.status ? req.query.status : "";
  const sortBy = req.query.sortBy ? req.query.sortBy : "transaction.id";
  const order = req.query.order ? req.query.order : "DESC";

  let id;
  try {
    const result = await storeModel.findStore(userID);
    id = result[0].id;
  } catch (err) {
    helper.printError(res, 500, err.message);
  }

  storeModel
    .getAllOrder(page, perPage, sortBy, order, id, status, keyword)
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

  storeModel
    .getAllDetailOrder(page, perPage, sortBy, order, id)
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

const removeImage = (filePath) => {
  filePath = path.join(__dirname, "../..", filePath);
  fs.unlink(filePath, (err) => new Error(err));
};
