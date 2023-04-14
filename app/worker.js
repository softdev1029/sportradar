import nhlapi from "./nhlapi.js";

function getFeedLive(id) {
  // get and analyze feed live
  nhlapi.getFeedLive(id, (resp) => {
    console.log(resp);
  });
}

// get item_id from last argv
let item_id = "";
process.argv.forEach(function (val) {
  item_id = val;
});
console.log("ITEM_ID: " + item_id);

// get feed live
while (true) {
  getFeedLive(item_id);
  // need to recall within 10s
  const delay = ms => new Promise(resolve => setTimeout(resolve, ms))
  await delay(10000);
}