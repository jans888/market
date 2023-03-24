const connection = require("../configs/dbConfig");

exports.getAllCategory = (
  queryPage,
  queryPerPage,
  keyword,
  sortBy,
  orderBy
) => {
  return new Promise((resolve, reject) => {
    connection.query(
      "SELECT COUNT(*) AS totalData FROM category WHERE name LIKE ?",
      `%${keyword}%`,
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
          `SELECT * FROM category WHERE name LIKE ? ORDER BY ${sortBy} ${orderBy} LIMIT ?, ?`,
          [`%${keyword}%`, firstData, perPage],
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
