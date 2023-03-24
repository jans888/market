const express = require("express");
const router = express.Router();
const orderController = require("../controllers/orderController");
const auth = require("../middlewares/auth");

router
  .get("/", auth.verification(), orderController.findAll)
  .get("/:id", auth.verification(), orderController.findAllDetail)
  .post("/", auth.verification(), orderController.create)
  .delete("/:id", auth.verification(), orderController.delete);

module.exports = router;
