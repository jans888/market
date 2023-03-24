const connection = require("../configs/dbConfig");

exports.getAllAddress = (queryPage, queryPerPage, sortBy, order, idUser) => {
  return new Promise((resolve, reject) => {
    connection.query(
      "SELECT COUNT(*) AS totalData FROM address WHERE idUser = ?",
      idUser,
      (err, result) => {
        let totalData, page, perPage, totalPage;
        if (err) {
          reject(new Error("Internal server error"));
        } else {
          totalData = result[0].totalData;
          page = queryPage ? parseInt(queryPage) : 1;
          perPage = queryPerPage ? parseInt(queryPerPage) : 5;
          totalPage = Math.ceil(totalData / perPage);
        }
        const firstData = perPage * page - perPage;
        connection.query(
          `SELECT * FROM address WHERE idUser = ? ORDER BY ${sortBy} ${order} LIMIT ?, ?`,
          [idUser, firstData, perPage],
          (err, result) => {
            if (err) {
              reject(new Error("Internal server error"));
            } else {
              resolve([totalData, totalPage, result, page, perPage]);
            }
          }
        );
      }
    );
  });
};

exports.getAddressById = (id) => {
  return new Promise((resolve, reject) => {
    connection.query(
      "SELECT * FROM address WHERE idUser = ? AND isPrimary = true LIMIT 1",
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

exports.insertAddress = (data) => {
  return new Promise((resolve, reject) => {
    connection.query(
      "SELECT * FROM address WHERE idUser = ? AND isPrimary = true",
      data.idUser,
      (err, result) => {
        if (!err) {
          if (result.length > 0 && data.isPrimary === true) {
            connection.query(
              "UPDATE address SET isPrimary = false WHERE idUser = ?",
              data.idUser,
              (err, result) => {
                if (!err) {
                  connection.query(
                    "INSERT INTO address SET ?",
                    data,
                    (err, result) => {
                      if (!err) {
                        connection.query(
                          "SELECT * FROM address WHERE idUser = ?",
                          data.idUser,
                          (err, result) => {
                            if (!err) {
                              resolve(result);
                            } else {
                              reject(new Error("Internal Server Error"));
                            }
                          }
                        );
                      } else {
                        reject(new Error("Internal Server Error"));
                      }
                    }
                  );
                } else {
                  reject(new Error("Internal Server Error"));
                }
              }
            );
          } else {
            connection.query(
              "INSERT INTO address SET ?",
              data,
              (err, result) => {
                if (!err) {
                  connection.query(
                    "SELECT * FROM address WHERE idUser = ?",
                    data.idUser,
                    (err, result) => {
                      if (!err) {
                        resolve(result);
                      } else {
                        reject(new Error("Internal Server Error"));
                      }
                    }
                  );
                } else {
                  reject(new Error("Internal Server Error"));
                }
              }
            );
          }
        } else {
          reject(new Error("Internal Server Error"));
        }
      }
    );
  });
};

exports.updateAddress = (idAddress, isPrimary, idUser) => {
  return new Promise((resolve, reject) => {
    connection.query(
      "SELECT * FROM address WHERE idUser = ? AND isPrimary = true",
      idUser,
      (err, result) => {
        if (!err) {
          if (result.length > 0 && result[0].isPrimary === 1) {
            connection.query(
              "UPDATE address SET isPrimary = false WHERE idUser = ?",
              idUser,
              (err, result) => {
                if (!err) {
                  connection.query(
                    "UPDATE address SET isPrimary = true WHERE id = ?",
                    idAddress,
                    (err, result) => {
                      if (!err) {
                        connection.query(
                          "SELECT * FROM address WHERE id = ?",
                          idAddress,
                          (err, result) => {
                            if (!err) {
                              resolve(result);
                            } else {
                              reject(new Error("Internal server error"));
                            }
                          }
                        );
                      } else {
                        reject(new Error("Internal Server Error"));
                      }
                    }
                  );
                } else {
                  reject(new Error("Internal Server Error"));
                }
              }
            );
          } else {
            connection.query(
              "UPDATE address SET isPrimary = true WHERE id = ?",
              idAddress,
              (err, result) => {
                if (!err) {
                  connection.query(
                    "SELECT * FROM address WHERE id = ?",
                    idAddress,
                    (err, result) => {
                      if (!err) {
                        resolve(result);
                      } else {
                        reject(new Error("Internal server error"));
                      }
                    }
                  );
                } else {
                  reject(new Error("Internal Server Error"));
                }
              }
            );
          }
        } else {
          reject(new Error("Internal Server Error"));
        }
      }
    );
  });
};

exports.deleteAddress = (idUser, idAddress) => {
  return new Promise((resolve, reject) => {
    connection.query(
      "DELETE FROM address WHERE idUser = ? AND id = ?",
      [idUser, idAddress],
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
