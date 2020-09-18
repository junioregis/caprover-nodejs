const express = require("express");

const redis = require("./db/redis");

const { google: googleScrapper } = require("./services/scrap");

class App {
  constructor(port, host) {
    this.port = port;
    this.host = host;

    this.app = express();
  }

  async loadRedis() {
    try {
      await redis.connect();

      console.log("[redis] ready");
    } catch (e) {
      throw new Error(`"[redis] ${e}`);
    }
  }

  startServices() {
    googleScrapper.start();
  }

  configRoutes() {
    this.app.get("/", (req, res) => {
      res.send("Hello World!");
    });
  }

  async start() {
    return new Promise(async (resolve, reject) => {
      try {
        await this.loadRedis();

        this.startServices();
        this.configRoutes();

        this.app.listen(this.port, this.host, () => {
          console.log("[server] ready");

          resolve();
        });
      } catch (e) {
        console.log(e);
        console.log(`[server] shutdown`);

        reject(e);
      }
    });
  }
}

module.exports = App;
