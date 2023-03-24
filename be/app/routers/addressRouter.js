const express = require("express");
const router = express.Router();
const addressController = require("../controllers/addressController");
const auth = require("../middlewares/auth");

router
  .get("/", auth.verification(), addressController.findAll)
  .get("/find-one", auth.verification(), addressController.findOne)
  .post("/", auth.verification(), addressController.insertAddress)
  .put("/:id", auth.verification(), addressController.updateAddress)
  .delete("/:id", auth.verification(), addressController.deleteAddress);

module.exports = router;
