import fetch from "node-fetch"

const baseurl = "https://statsapi.web.nhl.com";
const schedule = "/api/v1/schedule";
const feed_live = "/api/v1/game/ID/feed/live";

async function getBase(ret, path) {
  try {
    const req = await fetch(`${baseurl}/${path}`);
    const response = await req.json();
    if (req.status == 200) {
      ret(response);
    } else {
      ret(null);
    }
  } catch (err) {
    console.log(err);
    ret(null);
  }
}

async function getSchedule(ret) {
  getBase(ret, schedule);
}

async function getFeedLive(id, ret) {
  const path = feed_live.replace("ID", id);
  getBase(ret, path);
}

const api = {
  getSchedule,
  getFeedLive,
};

export default api;