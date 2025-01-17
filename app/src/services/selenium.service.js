const { Capabilities, Builder, By, Key, until } = require("selenium-webdriver");
const chrome = require("selenium-webdriver/chrome");

class SeleniumService {
  constructor() {
    this.server = "http://srv-captain--skeleton-selenium:4444/wd/hub";
    this.browser = "chrome";

    this.options = new chrome.Options();

    this.options.addArguments("--headless");

    this.builder = new Builder()
      .forBrowser(this.browser)
      .usingServer(this.server)
      .withCapabilities(Capabilities.chrome())
      .setChromeOptions(this.options);

    this.By = By;
    this.Key = Key;
    this.Until = until;
  }

  async nav(url, fn) {
    var driver;
    var ready = false;

    try {
      driver = await this.builder.build();
      ready = true;
    } catch (e) {
      console.log(`[scrap] ${e}`);
    }

    if (ready) {
      try {
        await driver.get(url);
        await fn(driver);
      } catch (e) {
        console.log(`[scrap] ${e}`);
      } finally {
        await driver.quit();
      }
    }
  }
}

module.exports = new SeleniumService();
