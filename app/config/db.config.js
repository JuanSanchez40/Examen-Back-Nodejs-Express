module.exports = {
  HOST:"localhost",
  USER: "for",
  PASSWORD: "1234",
  DB: "testdb",
  dialect: "mssql",
  pool: {
    max: 5,
    min: 0,
    acquire: 30000,
    idle: 10000
  }
};

