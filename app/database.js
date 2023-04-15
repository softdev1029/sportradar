import config from "./config.js"
import mysql from "mysql";

const connection = mysql.createConnection({
  host     : config.mysql.host,
  port     : config.mysql.port,
  user     : config.mysql.username,
  password : config.mysql.password,
  database : config.mysql.database,
});

function connect() {
  connection.connect();
};

function disConnect() {
  connection.end();
};

function get(ret) {
  let sql = "SELECT * from game";
  connection.query(sql, (error, rows) => {
    if (error) {
      console.error(error);
    } else {
      ret(rows);
    }
  });
};

function increaseCount(game_id, player_id, field) {
  let sql = "UPDATE `player_game` SET FIELD = FIELD + 1 WHERE `game_id` like ? and `player_id` like ?"
  if (field == "Scorer") {
    sql = sql.replaceAll("FIELD", "goals");
  } else if (field == "Assist") {
    sql = sql.replaceAll("FIELD", "assists");
  } else if (field == "Hitter") {
    sql = sql.replaceAll("FIELD", "hits");
  } else {
    return;
  }
  connection.query(sql, [game_id, player_id], () => {
  });
};

function createGame(data, ret) {
  let sql = "INSERT INTO `game`(`game_id`, `away_team_name`, `home_team_name`) VALUES (?, ?, ?)"
  connection.query(sql, data, (error, result) => {
    if (error) {
      if (error.code == "ER_DUP_ENTRY") {
        ret(null);
      } else {
        console.error(error);
      }
    } else {
      ret(result);
    }
  });
};

function createPlayers(data, ret) {
  const sqlData = [];
  for (const d of data) {
    sqlData.push({
      game_id: d[0],
      player_id: d[1],
      player_name: d[2],
      team_id: d[3],
      team_name: d[4],
      player_age: d[5],
      player_number: d[6],
      player_position: d[7],
      opponnet_team: d[8]
    });
  }
  const insert_columns = Object.keys(sqlData[0]);
  const insert_data = sqlData.reduce((a, i) => [...a, Object.values(i)], []);
  let sql = "INSERT INTO `player_game` (??) VALUES ?";
  connection.query(sql, [insert_columns, insert_data], (error, result) => {
      if (error) {
        if (error.code == "ER_DUP_ENTRY") {
          ret(null);
        } else {
          console.error(error);
        }
      } else {
        ret(result);
      }
  });
};

const database = {
  connect,
  disConnect,
  increaseCount,
  createGame,
  createPlayers,
  get
};

export default database;