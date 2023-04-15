import nhlapi from "./nhlapi.js";
import database from "./database.js";

const DEBUG_WORKER = true;

let item_id;
let game_created = false;
let checked_play = 0;
const teams = {};

function getOpponnetTeam(team_id) {
  for (const team in teams) {
    if (team_id != team) {
      return teams[team];
    }
  };

  return null;
}

function processGameData(gameData) {
  // check if game is finaled.
  if (!DEBUG_WORKER && gameData["status"]["detailedState"] == "Final") {
    database.disConnect();
    process.exit();
  }
  // create game
  if (!game_created) {
    teams[gameData["teams"]["away"]["id"]] = gameData["teams"]["away"];
    teams[gameData["teams"]["home"]["id"]] = gameData["teams"]["home"];
    let data = [item_id, gameData["teams"]["away"]["name"], gameData["teams"]["home"]["name"]];
    database.createGame(data, () => {
      console.log(item_id, "Game created in DB.");
      // create players
      const playersData = [];
      for (const player in gameData["players"]) {
        const data = gameData["players"][player];
        const oppTeam = getOpponnetTeam(data["currentTeam"]["id"]);
        const playerData = [
          item_id,
          data["id"],
          data["fullName"],
          data["currentTeam"]["id"],
          data["currentTeam"]["name"],
          data["currentAge"], data["primaryNumber"],
          data["primaryPosition"]["abbreviation"],
          oppTeam["name"]
        ];
        playersData.push(playerData);
      }
      console.log(item_id, "Start to create.");
      database.createPlayers(playersData, () => {
        console.log(item_id, "Players created in DB.");
        game_created = true;
      });
    });
  }
}

function processLiveData(liveData) {
  // process live data
  if (game_created) {
    const allPlays = liveData["plays"]["allPlays"];
    if (allPlays) {
      for (; checked_play < allPlays.length; checked_play ++) {
        const play = allPlays[checked_play];
        const players = play["players"];
        if (players) {
          console.log(checked_play, play["result"]["eventTypeId"], play["result"]["description"]);
          switch (play["result"]["eventTypeId"]) {
            case "GOAL":
            case "HIT":
              for (let i = 0; i < players.length; i ++) {
                database.increaseCount(item_id, players[i]["player"]["id"], players[i]["playerType"]);
              }
            break;

            default:
            break;
          }
        }
      }
    }
  }
}

function getFeedLive() {
  // get and analyze feed live
  nhlapi.getFeedLive(item_id, (resp) => {
    processGameData(resp["gameData"]);
    processLiveData(resp["liveData"]);
  });
}

// get item_id from last argv
process.argv.forEach(function (val) {
  item_id = val;
});
console.log("ITEM_ID: " + item_id);

// connect database
database.connect();

// get feed live
while (true) {
  getFeedLive(item_id);
  // need to recall within 10s
  const delay = ms => new Promise(resolve => setTimeout(resolve, ms))
  await delay(10000);
}