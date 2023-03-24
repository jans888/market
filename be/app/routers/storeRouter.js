const express = require("express");
const router = express.Router();
const storeController = require("../controllers/storeController");
const auth = require("../middlewares/auth");
const multer = require("../middlewares/multer");

router
  .get("/", auth.verification(), auth.isSeller(), storeController.findStore)
  .get(
    "/product",
    auth.verification(),
    auth.isSeller(),
    storeController.findAllProduct
  )
  .get(
    "/product/sold",
    auth.verification(),
    auth.isSeller(),
    storeController.findAllProductSold
  )
  .get(
    "/product/archive",
    auth.verification(),
    auth.isSeller(),
    storeController.findAllProductArchive
  )
  .post(
    "/",
    auth.verification(),
    auth.isSeller(),
    multer.uploadImage.array("image", 5),
    storeController.createProduct
  )
  .put(
    "/",
    auth.verification(),
    auth.isSeller(),
    multer.uploadImage.single("image"),
    storeController.updateStore
  )
  .get(
    "/order",
    auth.verification(),
    auth.isSeller(),
    storeController.findAllOrder
  )
  .get(
    "/order/:id",
    auth.verification(),
    auth.isSeller(),
    storeController.findAllDetail
  );

module.exports = router;
