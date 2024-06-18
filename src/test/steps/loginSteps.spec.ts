import { Given, When, Then } from "@cucumber/cucumber";
import {chromium, Page, Browser, expect, test} from "@playwright/test"

let browser: Browser;
let page: Page;

Given('que acessei a url {string}', async function (string) {
    browser = await chromium.launch({headless: false});
    page = await browser.newPage();
    await page.goto("https://www.portoseguro.com.br/");
    await page.getByRole('button', { name: 'Aceitar todos os cookies' }).click();
});

Given('cliquei no botão {string}', async function (string) {
    await page.getByLabel(string).click();
    await expect(page.getByLabel(string)).toBeVisible();
});

Given('cliquei na opção {string}', async function (string) {
    await expect(page.locator('button[data-gtm-name="entrar"]')).toBeEnabled();
    await page.locator('button[data-gtm-name="entrar"]').click();
});

Given('que preenchi o campo {string} com o dado {string}', async function (string, string2) {
    await page.getByLabel(string).pressSequentially(string2);
});

When('clico no botão {string}', async function (string) {
    await page.getByLabel('Entrar').click();
});

Then('deverá ser exibida a tela de loading com o título {string} e a mensagem {string}', async function (string, string2) {
    await expect(page.getByText('Sucesso!')).toBeVisible();
});

Then('deverá ser exibida a mensagem {string} no cabeçalho da página', async function (string) {
});