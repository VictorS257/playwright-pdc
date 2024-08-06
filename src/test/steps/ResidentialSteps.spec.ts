import { Given, When, Then } from "@cucumber/cucumber"
import {chromium, Page, Browser, expect, test} from "@playwright/test"

let browser: Browser
let page: Page
let pdclocal: "http://localhost:3000/pdc/"

Given('que o usuário se autenticou no PDC', async function (string) {
    browser = await chromium.launch({headless: true});
    page = await browser.newPage();
    await page.goto(pdclocal);
})

Given('está utilizando a visualização web', () => {
})

Given('acessou o produto "Seguro Residência"', () => {

})

Then('todos os componentes abaixo do componente breadcrumb deverão estar em estado de carregamento', () => {
})

When('o sistema está recebendo as informações da tela', () => {
})

Then('deve ser sempre exibido o componente header contendo &lt;icone&gt;, &lt;botao1&gt;, &lt;botao2&gt;, &lt;icone-interativo&gt;', () => {
})

When('o usuário navega entre as telas da aplicação', () => {
})
