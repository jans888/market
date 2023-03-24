const express = require("express");
const router = express.Router();
const usersController = require("../controllers/usersController");
const auth = require("../middlewares/auth");
const multer = require("../middlewares/multer");

router
  .get("/find-one", auth.verification(), usersController.findOne)
  .post("/", multer.uploadImage.single("image"), usersController.create)
  .get("/verify", usersController.verify)
  .post("/login", usersController.login)
  .post("/forgot-password", usersController.forgotPassword)
  .put("/reset-password", usersController.resetPassword)
  .put(
    "/:id",
    auth.verification(),
    multer.uploadImage.single("image"),
    usersController.update
  );

module.exports = router;
