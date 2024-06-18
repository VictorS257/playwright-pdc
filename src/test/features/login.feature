Feature: Validar funcionalidade de login no antigo PDC

  Background:
    Given que acessei a url "https://www.portoseguro.com.br/"
    And cliquei no botão "Área do Cliente"

  Scenario: Valido login com dados válidos
    Given que preenchi o campo "CPF ou CNPJ" com o dado "CPF"
    And cliquei na opção "Entrar"
    And que preenchi o campo "Senha" com o dado "senha"
    When clico na opção "Entrar"
    Then deverá ser exibida a tela de loading com o título "Sucesso!" e a mensagem "Login realizado com sucesso"
    And deverá ser exibida a mensagem "Olá, {{Nome}}" no cabeçalho da página
