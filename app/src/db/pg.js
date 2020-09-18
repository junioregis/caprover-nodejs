const { Sequelize } = require("sequelize");

module.exports = new Sequelize("db", "postgres", "postgres", {
  host: "srv-captain--skeleton-postgres",
  port: 4532,
  dialect: "postgres",
  logQueryParameters: true,
});
