const connection = require("../configs/dbConfig");

exports.getAllOrderUser = (
  queryPage,
  queryPerPage,
  sortBy,
  orderBy,
  id,
  status
) => {
  return new Promise((resolve, reject) => {
    connection.query(
      "SELECT COUNT(*) AS totalData FROM ((transaction INNER JOIN users ON transaction.idUser = users.id) INNER JOIN store ON transaction.idStore = store.id) WHERE transaction.idUser = ? AND transaction.status LIKE ?",
      [id, `%${status}%`],
      (err, resultCount) => {
        let totalData, page, perPage, totalPage;
        if (err) {
          reject(new Error("Internal Server Error"));
        } else {
          totalData = resultCount[0].totalData;
          page = queryPage ? parseInt(queryPage) : 1;
          perPage = queryPerPage ? parseInt(queryPerPage) : 5;
          totalPage = Math.ceil(totalData / perPage);
        }
        const firstData = perPage * page - perPage;
        connection.query(
          `SELECT transaction.id, users.name, users.email, store.name AS store, transaction.address, transaction.subTotal, transaction.postage, transaction.total, transaction.paymentMethod, transaction.status FROM ((transaction INNER JOIN users ON transaction.idUser = users.id) INNER JOIN store ON transaction.idStore = store.id) WHERE transaction.idUser = ? AND transaction.status LIKE ? ORDER BY ${sortBy} ${orderBy} LIMIT ?, ?`,
          [id, `%${status}%`, firstData, perPage],
          (err, result) => {
            if (!err) {
              resolve([totalData, totalPage, result, page, perPage]);
            } else {
              reject(new Error("Internal Server Error"));
            }
          }
        );
      }
    );
  });
};

exports.getAllDetailOrderUser = (
  queryPage,
  queryPerPage,
  sortBy,
  orderBy,
  id
) => {
  return new Promise((resolve, reject) => {
    connection.query(
      "SELECT COUNT(*) AS totalData FROM detail_transaction INNER JOIN product ON detail_transaction.idProduct = product.id WHERE detail_transaction.idTransaction = ?",
      id,
      (err, resultCount) => {
        let totalData, page, perPage, totalPage;
        if (err) {
          reject(new Error("Internal Server Error"));
        } else {
          totalData = resultCount[0].totalData;
          page = queryPage ? parseInt(queryPage) : 1;
          perPage = queryPerPage ? parseInt(queryPerPage) : 5;
          totalPage = Math.ceil(totalData / perPage);
        }
        const firstData = perPage * page - perPage;
        connection.query(
          `SELECT detail_transaction.id, product.title, product.image, detail_transaction.size, detail_transaction.qty, product.price FROM detail_transaction INNER JOIN product ON detail_transaction.idProduct = product.id WHERE detail_transaction.idTransaction = ? ORDER BY ${sortBy} ${orderBy} LIMIT ?, ?`,
          [id, firstData, perPage],
          (err, result) => {
            if (!err) {
              resolve([totalData, totalPage, result, page, perPage]);
            } else {
              reject(new Error("Internal Server Error"));
            }
          }
        );
      }
    );
  });
};

exports.createOrder = (data) => {
  return new Promise((resolve, reject) => {
    connection.query("INSERT INTO transaction SET ?", data, (err, result) => {
      if (!err) {
        connection.query(
          "SELECT * FROM transaction WHERE id = ?",
          result.insertId,
          (err, result) => {
            if (!err) {
              resolve(result);
            } else {
              reject(new Error("Internal server error"));
            }
          }
        );
      } else {
        reject(new Error("Internal server error"));
      }
    });
  });
};

exports.createOrderDetail = (data) => {
  return new Promise((resolve, reject) => {
    connection.query(
      "INSERT INTO detail_transaction SET ?",
      data,
      (err, result) => {
        if (!err) {
          connection.query(
            "SELECT * FROM detail_transaction WHERE id = ?",
            result.insertId,
            (err, result) => {
              if (!err) {
                resolve(result);
              } else {
                reject(new Error("Internal server error"));
              }
            }
          );
        } else {
          reject(new Error("Internal server error"));
        }
      }
    );
  });
};

exports.updateStock = (qty, id) => {
  return new Promise((resolve, reject) => {
    connection.query(
      "UPDATE product SET stock = stock - ? WHERE id = ?",
      [qty, id],
      (err, result) => {
        if (!err) {
          resolve(result);
        } else {
          reject(new Error("Internal srver error stock"));
        }
      }
    );
  });
};

exports.delete = (id) => {
  return new Promise((resolve, reject) => {
    connection.query(
      "DELETE FROM transaction WHERE id = ?",
      id,
      (err, result) => {
        if (!err) {
          resolve(result);
        } else {
          reject(new Error("Internal server error"));
        }
      }
    );
  });
};
