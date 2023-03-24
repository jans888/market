const connection = require("../configs/dbConfig");

exports.getAllProduct = (
  queryPage,
  queryPerPage,
  keyword,
  sortBy,
  orderBy,
  size,
  color,
  category,
  brand
) => {
  return new Promise((resolve, reject) => {
    connection.query(
      "SELECT COUNT(*) AS totalData FROM ((product INNER JOIN category ON product.idCategory = category.id) INNER JOIN store ON product.idStore = store.id) WHERE product.title LIKE ? AND product.size LIKE ? AND product.color LIKE ? AND category.name LIKE ? AND store.name LIKE ? AND product.isArchived = false AND product.stock > 0",
      [
        `%${keyword}%`,
        `%${size}%`,
        `%${color}%`,
        `%${category}%`,
        `%${brand}%`,
      ],
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
          `SELECT product.id, product.title, category.name AS category, store.name AS brand, product.image, product.size, product.color, product.price, product.conditions, product.description, product.stock, product.rating, product.isPopular FROM ((product INNER JOIN category ON product.idCategory = category.id) INNER JOIN store ON product.idStore = store.id) WHERE product.title LIKE ? AND product.size LIKE ? AND product.color LIKE ? AND category.name LIKE ? AND store.name LIKE ? AND product.isArchived = false AND product.stock > 0 ORDER BY ${sortBy} ${orderBy} LIMIT ?, ?`,
          [
            `%${keyword}%`,
            `%${size}%`,
            `%${color}%`,
            `%${category}%`,
            `%${brand}%`,
            firstData,
            perPage,
          ],
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

exports.getAllPopular = (queryPage, queryPerPage, sortBy, orderBy) => {
  return new Promise((resolve, reject) => {
    connection.query(
      "SELECT COUNT(*) AS totalData FROM ((product INNER JOIN category ON product.idCategory = category.id) INNER JOIN store ON product.idStore = store.id) WHERE product.isPopular = true AND product.isArchived = false AND product.stock > 0",
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
          `SELECT product.id, product.title, category.name AS category, store.name AS brand, product.image, product.price, product.conditions, product.description, product.stock, product.rating, product.isPopular FROM ((product INNER JOIN category ON product.idCategory = category.id) INNER JOIN store ON product.idStore = store.id) WHERE product.isPopular = true AND product.isArchived = false AND product.stock > 0 ORDER BY ${sortBy} ${orderBy} LIMIT ?, ?`,
          [firstData, perPage],
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

exports.getProductById = (id) => {
  return new Promise((resolve, reject) => {
    connection.query(
      "SELECT product.id, product.title, category.name AS category, product.idCategory, product.isArchived, store.name AS brand, store.id AS idBrand, product.image, product.price, product.color, product.size, product.conditions, product.description, product.stock, product.rating, product.isPopular FROM ((product INNER JOIN category ON product.idCategory = category.id) INNER JOIN store ON product.idStore = store.id) WHERE product.id = ?",
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

exports.getProductByCategory = (
  queryPage,
  queryPerPage,
  sortBy,
  orderBy,
  id
) => {
  return new Promise((resolve, reject) => {
    connection.query(
      "SELECT COUNT(*) AS totalData FROM ((product INNER JOIN category ON product.idCategory = category.id) INNER JOIN store ON product.idStore = store.id) WHERE category.id = ? AND product.isArchived = false AND product.stock > 0",
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
          `SELECT product.id, product.title, category.name AS category, store.name AS brand, product.image, product.price, product.conditions, product.description, product.stock, product.rating, product.isPopular FROM ((product INNER JOIN category ON product.idCategory = category.id) INNER JOIN store ON product.idStore = store.id) WHERE category.id = ? AND product.isArchived = false AND product.stock > 0 ORDER BY ${sortBy} ${orderBy} LIMIT ?, ?`,
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

exports.getAllImageProduct = (id) => {
  return new Promise((resolve, reject) => {
    connection.query(
      "SELECT gallery.id, gallery.image FROM gallery INNER JOIN product ON gallery.idProduct = product.id WHERE product.id = ?",
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

exports.deleteProduct = (id) => {
  return new Promise((resolve, reject) => {
    connection.query("DELETE FROM product WHERE id = ?", id, (err, result) => {
      if (!err) {
        resolve(result);
      } else {
        reject(new Error("Internal server error"));
      }
    });
  });
};

exports.checkArchive = (id) => {
  return new Promise((resolve, reject) => {
    connection.query(
      "SELECT isArchived FROM product WHERE id = ? AND isArchived = true",
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

exports.archive = (id) => {
  return new Promise((resolve, reject) => {
    connection.query(
      "UPDATE product SET isArchived = true WHERE id = ?",
      id,
      (err, result) => {
        if (!err) {
          connection.query(
            "SELECT * FROM product WHERE id = ?",
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

exports.unarchive = (id) => {
  return new Promise((resolve, reject) => {
    connection.query(
      "UPDATE product SET isArchived = false WHERE id = ?",
      id,
      (err, result) => {
        if (!err) {
          connection.query(
            "SELECT * FROM product WHERE id = ?",
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
