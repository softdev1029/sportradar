import database from "./database.js";
import nhlapi from "./nhlapi.js";
import moment from "moment";

const DEBUG_TRIGGER = true;

let triggeredItems = {};

function triggerItem(ctime, count, items) {
  for (let i = 0; i < count; i ++) {
    // will check only scheduled item
    if (DEBUG_TRIGGER || items[i]["status"]["detailedState"] == "Scheduled") {
      // check already triggered
      if (!triggeredItems[items[i]["gamePk"]]) {
        const startTime = new Date(items[i]["gameDate"]);
        const beforeTime = moment(startTime).add(-10, 's').format("YYYYMMDD_HHmmss");
        const afterTime = moment(startTime).add(10, 's').format("YYYYMMDD_HHmmss");
  
        // check start time of item
        if (DEBUG_TRIGGER || (ctime >= beforeTime && ctime <= afterTime)) {
          triggeredItems[items[i]["gamePk"]] = items[i]["status"]["detailedState"];
          console.log('Start: ', items[i]["gameDate"], items[i]["link"], items[i]["status"]["detailedState"]);
        }
      }
    }

    // remove finished item
    if (!DEBUG_TRIGGER && items[i]["status"]["detailedState"] == "Final") {
      if (triggeredItems[items[i]["gamePk"]]) {
        delete triggeredItems[items[i]["gamePk"]];
      }
    }
  }
}

function getNHLSchedule() {
  // get and analyze schedule data
  nhlapi.getSchedule((resp) => {
    const currentTime = resp["metaData"]["timeStamp"];
    const dates = resp["dates"];
    for (const dateItem of dates) {
      const date = dateItem["date"];
  
      triggerItem(currentTime, dateItem["totalEvents"], dateItem["events"]);
      triggerItem(currentTime, dateItem["totalGames"], dateItem["games"]);
      triggerItem(currentTime, dateItem["totalMatches"], dateItem["matches"]);
    }
  });
}

database.get((rows) => {
  //console.log('Game is: ', rows);
});

console.log("XXXXXX", process.argv[0]);
console.log("XXXXXX", process.argv[1]);
console.log("XXXXXX", process.argv[2]);

// get schedule
while (true) {
  getNHLSchedule();
  // need to recall within 10s
  const delay = ms => new Promise(resolve => setTimeout(resolve, ms))
  await delay(10000);
}