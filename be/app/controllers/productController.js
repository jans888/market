const path = require("path");
const fs = require("fs");
const productModel = require("../models/productModel");
const helper = require("../helpers/printHelper");

exports.findAll = (req, res) => {
  const { page, perPage } = req.query;
  const keyword = req.query.keyword ? req.query.keyword : "";
  const size = req.query.size ? req.query.size : "";
  const color = req.query.color ? req.query.color : "";
  const category = req.query.category ? req.query.category : "";
  const brand = req.query.brand ? req.query.brand : "";
  const sortBy = req.query.sortBy ? req.query.sortBy : "product.id";
  const order = req.query.order ? req.query.order : "DESC";

  productModel
    .getAllProduct(
      page,
      perPage,
      keyword,
      sortBy,
      order,
      size,
      color,
      category,
      brand
    )
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

exports.findAllPopular = (req, res) => {
  const { page, perPage } = req.query;
  const sortBy = req.query.sortBy ? req.query.sortBy : "product.id";
  const order = req.query.order ? req.query.order : "ASC";

  productModel
    .getAllPopular(page, perPage, sortBy, order)
    .then(([totalData, totalPage, result, page, perPage]) => {
      if (result < 1) {
        helper.printError(res, 400, "Product popular not found");
        return;
      }
      helper.printPaginate(
        res,
        200,
        "Find all product popular successfully",
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
  const id = req.params.id;

  productModel
    .getProductById(id)
    .then((result) => {
      if (result < 1) {
        helper.printError(res, 400, `Cannot find one product with id = ${id}`);
        return;
      }
      delete result[0].createdAt;
      delete result[0].updatedAt;
      helper.printSuccess(res, 200, "Find one product successfully", result);
    })
    .catch((err) => {
      helper.printError(res, 500, err.message);
    });
};

exports.findAllByCategory = (req, res) => {
  const id = req.params.id;
  const { page, perPage } = req.query;
  const sortBy = req.query.sortBy ? req.query.sortBy : "product.id";
  const order = req.query.order ? req.query.order : "ASC";

  productModel
    .getProductByCategory(page, perPage, sortBy, order, id)
    .then(([totalData, totalPage, result, page, perPage]) => {
      if (result < 1) {
        helper.printError(res, 400, "Product not found");
        return;
      }
      helper.printPaginate(
        res,
        200,
        "Find all product by category successfully",
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

exports.findAllImageProduct = (req, res) => {
  const id = req.params.id;

  productModel
    .getAllImageProduct(id)
    .then((result) => {
      if (result < 1) {
        helper.printError(
          res,
          400,
          `Cannot find all image product with id = ${id}`
        );
        return;
      }
      helper.printSuccess(
        res,
        200,
        "Find all image product successfully",
        result
      );
    })
    .catch((err) => {
      helper.printError(res, 500, err.message);
    });
};

exports.deleteProduct = async (req, res) => {
  const id = req.params.id;

  try {
    const result = await productModel.getAllImageProduct(id);
    if (result < 1) {
      helper.printError(res, 400, `Error deleting product with id = ${id}`);
      return;
    }
    result.map((item, index) => {
      return removeImage(item.image);
    });
    await productModel.deleteProduct(id);
    helper.printSuccess(res, 200, "Delete product successfully", {});
  } catch (err) {
    helper.printError(res, 500, err.message);
  }
};

exports.archive = async (req, res) => {
  const id = req.params.id;

  try {
    const archive = await productModel.checkArchive(id);
    if (archive.length > 0) {
      helper.printError(res, 400, "The product has been archived");
      return;
    }
  } catch (err) {
    helper.printError(res, 500, err.message);
    return;
  }

  productModel
    .archive(id)
    .then((result) => {
      if (result < 1) {
        helper.printError(res, 400, `Cannot archived product with id = ${id}`);
        return;
      }
      helper.printSuccess(res, 200, "Your product has been archived", result);
    })
    .catch((err) => {
      helper.printError(res, 500, err.message);
    });
};

exports.unarchive = async (req, res) => {
  const id = req.params.id;

  productModel
    .unarchive(id)
    .then((result) => {
      if (result < 1) {
        helper.printError(
          res,
          400,
          `Cannot unarchived product with id = ${id}`
        );
        return;
      }
      helper.printSuccess(res, 200, "Your product has been unarchived", result);
    })
    .catch((err) => {
      helper.printError(res, 500, err.message);
    });
};

const removeImage = (filePath) => {
  filePath = path.join(__dirname, "../..", filePath);
  fs.unlink(filePath, (err) => new Error(err));
};
