import * as puppeteer from 'puppeteer';

(async () => {
    const browser = await puppeteer.launch({
      headless: false, 
      args: ['--no-sandbox', '--disable-dev-shm-usage'],
      executablePath: '/usr/bin/chromium-browser'
    });
    const page = await browser.newPage();
    await page.goto('https://example.com');
    await page.screenshot({path: 'example.png'});
    await page.waitFor(400000);
    await browser.close();
})();