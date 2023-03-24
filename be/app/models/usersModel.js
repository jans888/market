const bcrypt = require("bcrypt");
const connection = require("../configs/dbConfig");

exports.getUsersById = (id) => {
  return new Promise((resolve, reject) => {
    connection.query("SELECT * FROM users WHERE id = ?", id, (err, result) => {
      if (!err) {
        resolve(result);
      } else {
        reject(new Error("Internal server error"));
      }
    });
  });
};

exports.createUsers = (data, isSeller) => {
  return new Promise((resolve, reject) => {
    connection.query(
      "SELECT * FROM users WHERE email = ?",
      data.email,
      (err, result) => {
        if (result.length > 0) {
          reject(new Error("Email has been registered"));
        } else {
          if (isSeller === "true" || isSeller === true) {
            connection.query(
              "SELECT * FROM users WHERE phoneNumber = ?",
              data.phoneNumber,
              (err, result) => {
                if (result.length > 0) {
                  reject(new Error("Phone number is already in use"));
                } else {
                  connection.query(
                    "INSERT INTO users SET ?",
                    data,
                    (err, result) => {
                      if (!err) {
                        connection.query(
                          "SELECT * FROM users WHERE id = ?",
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
                        reject(new Error(err));
                      }
                    }
                  );
                }
              }
            );
          } else {
            connection.query("INSERT INTO users SET ?", data, (err, result) => {
              if (!err) {
                connection.query(
                  "SELECT * FROM users WHERE id = ?",
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
                reject(new Error(err));
              }
            });
          }
        }
      }
    );
  });
};

exports.createUsersToken = (data) => {
  return new Promise((resolve, reject) => {
    connection.query("INSERT INTO user_token SET ?", data, (err, result) => {
      if (!err) {
        resolve(result);
      } else {
        reject(new Error("Internal server error"));
      }
    });
  });
};

exports.createStore = (data) => {
  return new Promise((resolve, reject) => {
    connection.query("INSERT INTO store SET ?", data, (err, result) => {
      if (!err) {
        resolve(result);
      } else {
        reject(new Error("Internal server error"));
      }
    });
  });
};

exports.checkStore = (data) => {
  return new Promise((resolve, reject) => {
    connection.query(
      "SELECT * FROM store WHERE name = ?",
      data,
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

exports.findEmail = (email) => {
  return new Promise((resolve, reject) => {
    connection.query(
      "SELECT email FROM users WHERE email = ?",
      email,
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

exports.findToken = (token) => {
  return new Promise((resolve, reject) => {
    connection.query(
      "SELECT token FROM user_token WHERE token = ?",
      token,
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

exports.deleteEmail = (email) => {
  return new Promise((resolve, reject) => {
    connection.query(
      "DELETE FROM users WHERE email = ?",
      email,
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

exports.deleteToken = (email) => {
  return new Promise((resolve, reject) => {
    connection.query(
      "DELETE FROM user_token WHERE email = ?",
      email,
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

exports.setActive = (email) => {
  return new Promise((resolve, reject) => {
    connection.query(
      "UPDATE users SET active = true WHERE email = ?",
      email,
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

exports.login = (data, isSeller) => {
  return new Promise((resolve, reject) => {
    connection.query(
      "SELECT * FROM users WHERE email = ?",
      data.email,
      (err, result) => {
        if (err) {
          reject(new Error("Internal server error"));
        } else {
          if (result.length === 1) {
            const user = result[0];
            if (result[0].active === 0) {
              reject(new Error("Your email is not activated"));
            } else {
              let role;
              let message;
              if (isSeller === "true" || isSeller === true) {
                role = 1;
                message = "seller";
              } else {
                role = 2;
                message = "customer";
              }
              connection.query(
                `SELECT * FROM users WHERE email = ? AND role = ${role}`,
                data.email,
                (err, result) => {
                  if (!err) {
                    if (result.length < 1) {
                      reject(
                        new Error(
                          `Your email is not registered as a ${message}`
                        )
                      );
                    } else {
                      bcrypt.compare(
                        data.password,
                        result[0].password,
                        (err, result) => {
                          if (err) {
                            reject(new Error("Internal server error"));
                          } else {
                            if (result) {
                              resolve(user);
                            } else {
                              reject(new Error("Wrong password"));
                            }
                          }
                        }
                      );
                    }
                  } else {
                    reject(new Error("Internal server error"));
                  }
                }
              );
            }
          } else {
            reject(new Error("Your email is not registered"));
          }
        }
      }
    );
  });
};

exports.findAccount = (data) => {
  return new Promise((resolve, reject) => {
    connection.query(
      "SELECT * FROM users WHERE email = ?",
      data,
      (err, result) => {
        if (!err) {
          if (result.length < 1) {
            reject(new Error("Your email is not registered"));
          } else {
            connection.query(
              "SELECT * FROM users WHERE email = ? AND active = true",
              data,
              (err, result) => {
                if (!err) {
                  if (result.length < 1) {
                    reject(new Error("Your email is not activated"));
                  } else {
                    resolve(result);
                  }
                } else {
                  reject(new Error("Internal server error"));
                }
              }
            );
          }
        } else {
          reject(new Error("Internal server error"));
        }
      }
    );
  });
};

exports.updateUsers = (id, data) => {
  return new Promise((resolve, reject) => {
    connection.query(
      `SELECT * FROM users WHERE NOT id = ? AND email = ?`,
      [id, data.email],
      (err, result) => {
        if (result.length > 0) {
          reject(new Error("Email is already in use"));
        } else {
          connection.query(
            `SELECT * FROM users WHERE NOT id = ? AND phoneNumber = ?`,
            [id, data.phoneNumber],
            (err, result) => {
              if (result.length > 0) {
                reject(new Error("Phone number is already in use"));
              } else {
                connection.query(
                  "UPDATE users SET ? WHERE id = ?",
                  [data, id],
                  (err, result) => {
                    if (!err) {
                      connection.query(
                        "SELECT * FROM users WHERE id = ?",
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
              }
            }
          );
        }
      }
    );
  });
};

exports.findUser = (id, message) => {
  return new Promise((resolve, reject) => {
    connection.query("SELECT * FROM users WHERE id = ?", id, (err, result) => {
      if (!err) {
        if (result.length == 1) {
          resolve(result);
        } else {
          reject(new Error(`Cannot ${message} users with id = ${id}`));
        }
      } else {
        reject(new Error("Internal server error"));
      }
    });
  });
};

exports.findEmail = (email, message) => {
  return new Promise((resolve, reject) => {
    connection.query(
      "SELECT * FROM users WHERE email = ?",
      email,
      (err, result) => {
        if (!err) {
          if (result.length == 1) {
            resolve(result);
          } else {
            reject(new Error(`Cannot ${message} users with email = ${email}`));
          }
        } else {
          reject(new Error("Internal server error"));
        }
      }
    );
  });
};

exports.createToken = (data) => {
  return new Promise((resolve, reject) => {
    connection.query("INSERT INTO access_token SET ?", data, (err, result) => {
      if (!err) {
        resolve(result);
      } else {
        reject(new Error("Internal server error"));
      }
    });
  });
};

exports.setPassword = (password, email) => {
  return new Promise((resolve, reject) => {
    connection.query(
      `UPDATE users SET password = ?, active = true WHERE email = ?`,
      [password, email],
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

exports.updateActive = (id) => {
  return new Promise((resolve, reject) => {
    connection.query(
      "UPDATE users SET active = false WHERE id = ?",
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
