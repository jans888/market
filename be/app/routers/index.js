const express = require("express");
const route = express.Router();

const usersRouter = require("./usersRouter");
const addressRouter = require("./addressRouter");
const orderRouter = require("./orderRouter");
const productRouter = require("./productRouter");
const categoryRouter = require("./categoryRouter");
const cartRouter = require("./cartRouter");
const storeRouter = require("./storeRouter");

route.use("/users", usersRouter);
route.use("/address", addressRouter);
route.use("/order", orderRouter);
route.use("/product", productRouter);
route.use("/category", categoryRouter);
route.use("/cart", cartRouter);
route.use("/store", storeRouter);

module.exports = route;
