Feature: Valido tela de login do PortoID

    Scenario:CT01 - Valido exibição da tela de login
        Given que o usuário não está autenticado
        When acessa o PortoID
        Then deverá ser exibido o container com o título "Tudo da Porto com um único ID"
        And o container deverá conter o subtítulo "Com a Porto ID, você acessa todas as soluções da Porto em um só lugar."
        And abaixo do subtítuo deverá ser exibido o campo do tipo input com placeholder "Seu CPF/CNPJ é a Porto ID"
        And abaixo do input deverá existir o botão switch "Lembrar meus dados" marcado
        And abaixo do switch deverá existir o botão "Continuar" desativado

    # Cenário:CT02 - Valido preenchimento do campo "Seu CPF/CNPJ é a Porto ID"
    #     Dado que o usuário está na tela inicial do PortoID sem dados preenchidos
    #     Quando inicia a digitação no campo "Seu CPF/CNPJ é a Porto ID"
    #     Então deverá ser habilitado o botão {x} que irá limpar o campo
    #     E o botão "Continuar" deverá ser habilitado ao atingir "11" e "14" dígitos

    # Cenário:CT03 - PortoID com cadastro completo
    #     Dado que o usuário informou um PortoID com cadastro completo
    #     Quando clica no botão "Continuar"
    #     Então deverá ser exibido o container com título "Olá, {nome}!"
    #     E o container deverá conter o subtítulo "CPF {cpf}"
    #     E abaixo do subtítulo deverá existir o botão "Entrar com outra Porto ID"
    #     E deverá existir o campo do tipo input com placeholder "Digite sua senha"
    #     E o campo deverá conter o botão de exibir a senha
    #     E abaixo do campo deverá existir o botão "Fazer login" desabilitado
    #     E deverá existir o botão "Esqueci minha senha"

    # Cenário:CT04 - Valido preenchimento do campo "Digite sua senha"
    #     Dado que o usuário está na tela de senha
    #     Quando inicia a digitação no campo "Digite sua senha"
    #     Então o botão "Fazer login" deverá ser habilitado

    # Cenário:CT05 - Valido botão "Entrar com outra Porto ID"
    #     Dado que o usuário está na tela de senha
    #     Quando clica no botão "Entrar com outra Porto ID"
    #     Então deverá ser exibida a tela inicial do PortoID sem dados preenchidos

    # Cenário:CT06 - Senha incorreta
    #     Dado que o usuário está na tela de senha
    #     E informa uma senha incorreta
    #     Quando clica no botão "Fazer login"
    #     Então o campo "Digite sua senha" deverá assumir a cor vermelha
    #     E abaixo do campo deverá existir a mensagem "Senha inválida. Verifque e tente de novo."
    #     E ao lado do botão de exibir a senha deverá ser exibido o {icone-aviso}

    # Cenário:CT07 - Valido exibição da contagem regressiva para bloqueio por senha
    #     Dado o usuário informou uma senha incorreta "2" vezes
    #     Quando clico no botão "Fazer login"
    #     Então abaixo do campo "Digite sua senha" deverá ser exibida a mensagem "Senha inválida. Você tem mais {tentativas} tentativas."
    #     E para cada nova digitação incorreta deverá ser subtraído "1" do número de tentativas

    # Cenário:CT08 - PortoID bloqueado por senha
    #     Dado que o usuário informou uma senha incorreta "5" vezes
    #     Quando clica no botão "Fazer login"
    #     Então a conta do usuário deverá ser bloqueada
    #     E deverá ser exibida a tela de bloqueio por senha

    # Cenário:CT09 - Valido tela de bloqueio por senha
    #     Dado que o usuário informa um PortoID bloqueado 
    #     Quando clica no botão "Fazer login"
    #     Então deverá ser exibido o container com o título "Sua conta foi bloqueada"
    #     E o subtítulo "Notamos uma atividade incomum e bloqueamos sua conta, mas não se preocupe, que te ajudaremos a recuperar.\nEntre em contato com nossa Central de Atendimento."
    #     E deverão existir os botões "Acessar chat", "Voltar para o início"

    # Cenário:CT10 - Valido botão "Acessar chat" na tela de bloqueio por senha
    #     Dado que o usuário está na tela de bloqueio por senha
    #     Quando clica no botão "Acessar chat"
    #     Então deverá ser direcionado para o {chat-porto}

    # Cenário:CT11 - Valido botão "Voltar para o início" na tela de bloqueio
    #     Dado que o usuário está na tela de bloqueio por senha
    #     Quando clica no botão "Voltar para o início"
    #     Então deverá ser exibida a tela inicial do PortoID sem dados preenchidos

    # Cenário:CT12 - Login com sucesso
    #     Dado que o usuário está na tela de senha
    #     E informou a senha correta
    #     Quando clica no botão "Fazer login"
    #     Então deverá ser direcionado para "Home-PDC"

    # Cenário:CT13 - PortoID sem dados de contato
    #     Dado que o usuário informou um PortoID sem dados de contato cadastrados
    #     Quando clica no botão "Fazer login"
    #     Então deverá ser exibido o container com o título "Olá, {nome}!"
    #     E subtítulo "Precisamos atualizar seu cadastro.\nÉ simples: baixe o app, confirme sua identidade com uma foto e atualize seus dados de contato."
    #     E abaixo do subtítulo deverá existir os botões "AppStore", "GooglePlay"
    #     E deverá existir a mensagem "Tem dúvidas? Fale conosco!"
    #     E abaixo da mensagem deverá existir o botão "Acessar chat"

    # Cenário:CT14 - Valido botão "Acessar chat" na tela de dados incompletos
    #     Dado que o usuário está na tela de dados incompletos
    #     Quando clica no botão "Acessar chat"
    #     Então deverá ser direcionado para o {chat-porto}