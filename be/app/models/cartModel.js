const connection = require("../configs/dbConfig");

exports.getAllCart = (queryPage, queryPerPage, sortBy, orderBy, id) => {
  return new Promise((resolve, reject) => {
    connection.query(
      "SELECT COUNT(*) AS totalData FROM ((bag INNER JOIN product ON bag.idProduct = product.id) INNER JOIN store ON bag.idStore = store.id) WHERE bag.idUser = ?",
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
          `SELECT bag.id, bag.idProduct, product.image, product.title, bag.idStore, store.name AS brand, bag.color, bag.size, bag.qty, bag.price, bag.total FROM ((bag INNER JOIN product ON bag.idProduct = product.id) INNER JOIN store ON bag.idStore = store.id) WHERE bag.idUser = ? ORDER BY ${sortBy} ${orderBy} LIMIT ?, ?`,
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

exports.createCart = (data) => {
  return new Promise((resolve, reject) => {
    connection.query("INSERT INTO bag SET ?", data, (err, result) => {
      if (!err) {
        connection.query(
          "SELECT * FROM bag WHERE id = ?",
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

exports.updateCart = (id, qty, price) => {
  return new Promise((resolve, reject) => {
    connection.query(
      "UPDATE bag SET qty = ?, total = ? WHERE id = ?",
      [qty, price, id],
      (err, result) => {
        if (!err) {
          connection.query(
            "SELECT * FROM bag WHERE id = ?",
            id,
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

exports.deleteCart = (idCart, idUser) => {
  return new Promise((resolve, reject) => {
    connection.query(
      "DELETE FROM bag WHERE id = ? AND idUser = ?",
      [idCart, idUser],
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

exports.getCountCart = (id) => {
  return new Promise((resolve, reject) => {
    connection.query(
      "SELECT COUNT(*) AS totalCart FROM ((bag INNER JOIN product ON bag.idProduct = product.id) INNER JOIN store ON bag.idStore = store.id) WHERE bag.idUser = ?",
      id,
      (err, result) => {
        if (err) {
          reject(new Error("Internal Server Error"));
        } else {
          resolve(result);
        }
      }
    );
  });
};
