import config from "./config.js"
import mysql from "mysql";

const connection = mysql.createConnection({
  host     : config.mysql.host,
  port     : config.mysql.port,
  user     : config.mysql.username,
  password : config.mysql.password,
  database : config.mysql.database,
});

function get(ret) {
  connection.connect();
  connection.query('SELECT * from game', (error, rows) => {
    if (error) throw error;
    ret(rows);
  });
  connection.end();
};

const database = {
  get
};

export default database;