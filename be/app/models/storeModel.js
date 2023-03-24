const connection = require("../configs/dbConfig");

exports.findStore = (id) => {
  return new Promise((resolve, reject) => {
    connection.query(
      "SELECT store.id, store.name AS store, users.email, users.phoneNumber, store.description, users.image FROM store INNER JOIN users ON store.idUser = users.id WHERE idUser = ?",
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

exports.findStoreUpdate = (id, message) => {
  return new Promise((resolve, reject) => {
    connection.query(
      "SELECT store.id, store.name AS store, users.email, users.phoneNumber, store.description, users.image FROM store INNER JOIN users ON store.idUser = users.id WHERE idUser = ?",
      id,
      (err, result) => {
        if (!err) {
          if (result.length == 1) {
            resolve(result);
          } else {
            reject(new Error(`Cannot ${message} store with id = ${id}`));
          }
        } else {
          reject(new Error("Internal server error"));
        }
      }
    );
  });
};

exports.getAllProduct = (
  storeID,
  sortBy,
  order,
  queryPage,
  queryPerPage,
  keyword
) => {
  return new Promise((resolve, reject) => {
    connection.query(
      "SELECT COUNT(*) AS totalData FROM ((product INNER JOIN category ON product.idCategory = category.id) INNER JOIN store ON product.idStore = store.id) WHERE product.idStore = ? AND product.title LIKE ?",
      [storeID, `%${keyword}%`],
      (err, resultCount) => {
        let totalData, page, perPage, totalPage;
        if (err) {
          reject(new Error("Internal server error"));
        } else {
          totalData = resultCount[0].totalData;
          page = queryPage ? parseInt(queryPage) : 1;
          perPage = queryPerPage ? parseInt(queryPerPage) : 5;
          totalPage = Math.ceil(totalData / perPage);
        }
        const firstData = perPage * page - perPage;
        connection.query(
          `SELECT product.id, product.title, category.name AS category, store.name AS brand, product.image, product.size, product.color, product.price, product.conditions, product.description, product.stock, product.rating, product.isPopular FROM ((product INNER JOIN category ON product.idCategory = category.id) INNER JOIN store ON product.idStore = store.id) WHERE product.idStore = ? AND product.title LIKE ? ORDER BY ${sortBy} ${order} LIMIT ?, ?`,
          [storeID, `%${keyword}%`, firstData, perPage],
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

exports.getAllProductSold = (
  storeID,
  sortBy,
  order,
  queryPage,
  queryPerPage
) => {
  return new Promise((resolve, reject) => {
    connection.query(
      "SELECT COUNT(*) AS totalData FROM ((product INNER JOIN category ON product.idCategory = category.id) INNER JOIN store ON product.idStore = store.id) WHERE product.idStore = ? AND product.stock = 0",
      storeID,
      (err, resultCount) => {
        let totalData, page, perPage, totalPage;
        if (err) {
          reject(new Error("Internal server error"));
        } else {
          totalData = resultCount[0].totalData;
          page = queryPage ? parseInt(queryPage) : 1;
          perPage = queryPerPage ? parseInt(queryPerPage) : 5;
          totalPage = Math.ceil(totalData / perPage);
        }
        const firstData = perPage * page - perPage;
        connection.query(
          `SELECT product.id, product.title, category.name AS category, store.name AS brand, product.image, product.size, product.color, product.price, product.conditions, product.description, product.stock, product.rating, product.isPopular FROM ((product INNER JOIN category ON product.idCategory = category.id) INNER JOIN store ON product.idStore = store.id) WHERE product.idStore = ? AND product.stock = 0 ORDER BY ${sortBy} ${order} LIMIT ?, ?`,
          [storeID, firstData, perPage],
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

exports.getAllProductArchive = (
  storeID,
  sortBy,
  order,
  queryPage,
  queryPerPage
) => {
  return new Promise((resolve, reject) => {
    connection.query(
      "SELECT COUNT(*) AS totalData FROM ((product INNER JOIN category ON product.idCategory = category.id) INNER JOIN store ON product.idStore = store.id) WHERE product.idStore = ? AND product.isArchived = true",
      storeID,
      (err, resultCount) => {
        let totalData, page, perPage, totalPage;
        if (err) {
          reject(new Error("Internal server error"));
        } else {
          totalData = resultCount[0].totalData;
          page = queryPage ? parseInt(queryPage) : 1;
          perPage = queryPerPage ? parseInt(queryPerPage) : 5;
          totalPage = Math.ceil(totalData / perPage);
        }
        const firstData = perPage * page - perPage;
        connection.query(
          `SELECT product.id, product.title, category.name AS category, store.name AS brand, product.image, product.size, product.color, product.price, product.conditions, product.description, product.stock, product.rating, product.isPopular FROM ((product INNER JOIN category ON product.idCategory = category.id) INNER JOIN store ON product.idStore = store.id) WHERE product.idStore = ? AND product.isArchived = true ORDER BY ${sortBy} ${order} LIMIT ?, ?`,
          [storeID, firstData, perPage],
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

exports.insertProduct = (data) => {
  return new Promise((resolve, reject) => {
    connection.query("INSERT INTO product SET ?", data, (err, result) => {
      if (!err) {
        connection.query(
          "SELECT * FROM product WHERE id = ?",
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

exports.insertGallery = (data) => {
  return new Promise((resolve, reject) => {
    connection.query("INSERT INTO gallery SET ?", data, (err, result) => {
      if (!err) {
        connection.query(
          "SELECT * FROM gallery WHERE id = ?",
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

exports.findProduct = (idStore, title) => {
  return new Promise((resolve, reject) => {
    connection.query(
      `SELECT COUNT(*) AS totalProduct FROM product WHERE idStore = ? AND title = ?`,
      [idStore, title],
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

exports.updateStore = (id, dataStore) => {
  return new Promise((resolve, reject) => {
    connection.query(
      `UPDATE store SET ? WHERE idUser = ?`,
      [dataStore, id],
      (err, result) => {
        if (!err) {
          connection.query(
            `SELECT store.id, store.name AS store, users.email, users.phoneNumber, store.description, users.image FROM store INNER JOIN users ON store.idUser = users.id WHERE idUser = ?`,
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

exports.checkStore = (id, data) => {
  return new Promise((resolve, reject) => {
    connection.query(
      "SELECT * FROM store WHERE NOT idUser = ? AND name = ?",
      [id, data],
      (err, result) => {
        if (err) {
          reject(new Error("Internal server error"));
        } else {
          resolve(result);
        }
      }
    );
  });
};

exports.getAllOrder = (
  queryPage,
  queryPerPage,
  sortBy,
  orderBy,
  id,
  status,
  keyword
) => {
  return new Promise((resolve, reject) => {
    connection.query(
      "SELECT COUNT(*) AS totalData FROM ((transaction INNER JOIN users ON transaction.idUser = users.id) INNER JOIN store ON transaction.idStore = store.id) WHERE transaction.idStore = ? AND transaction.status LIKE ? AND users.name LIKE ?",
      [id, `%${status}%`, `%${keyword}%`],
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
          `SELECT transaction.id, users.name, users.email, store.name AS store, transaction.address, transaction.subTotal, transaction.postage, transaction.total, transaction.paymentMethod, transaction.status FROM ((transaction INNER JOIN users ON transaction.idUser = users.id) INNER JOIN store ON transaction.idStore = store.id) WHERE transaction.idStore = ? AND transaction.status LIKE ? AND users.name LIKE ? ORDER BY ${sortBy} ${orderBy} LIMIT ?, ?`,
          [id, `%${status}%`, `%${keyword}%`, firstData, perPage],
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

exports.getAllDetailOrder = (queryPage, queryPerPage, sortBy, orderBy, id) => {
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
