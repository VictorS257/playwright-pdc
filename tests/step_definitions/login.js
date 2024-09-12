const { Given, When, Then } = require("@cucumber/cucumber")
const { chromium } = require("@playwright/test")
const { default: test } = require("node:test")

let browser
let page


    Given('que o usuário não está autenticado', async function () {
        let usuariopf = "58050976564"
    })

    When('acessa o PortoID', async function () {
        browser = await chromium.launch({ headless: false })
        page = await browser.newPage()
        page.goto('https://apps.portaldocliente.dev.awsporto/react-ssr-corp-pdcp-auth-webb/login')
    });

    Then('deverá ser exibido o container com o título {string}', async function (string) {

    });

    Then('o container deverá conter o subtítulo {string}', async function (string) {

    });

    Then('abaixo do subtítuo deverá ser exibido o campo do tipo input com placeholder {string}', async function (string) {

    });

    Then('abaixo do input deverá existir o botão switch {string} marcado', async function (string) {

    });

    Then('abaixo do switch deverá existir o botão {string} desativado', async function (string) {

    });
