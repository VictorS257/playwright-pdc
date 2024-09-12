#language: pt
Funcionalidade: Valido tela de ativação do PortoID

    Esquema do Cenário:CT01 - Valido tela inicial de ativação de conta
        Dado que o usuário informou um PortoID em ativação
        Quando clica no botão "Continuar"
        Então deverá ser exibido o container com título "Escolha um método de validação"
        E abaixo do título deverá existir o container contendo <icone>, <titulo>, <mensagem>, <icone-interativo>
        E abaixo dos containers deverá existir o botão "Não reconheço os dados"
        Exemplos:
            | icone           | titulo   | mensagem                                                             | icone-interativo |
            | {icone-celular} | "SMS"    | Vamos enviar um código para o telefone terminado em {celular-final}. | {>}              |
            | (icone-email)   | "E-mail" | Vamos enviar um código para {email}.                                 | {>}              |
                
        Regra: Validação por SMS
            Cenário:CT02 - Valido loading da opção "SMS"
                Dado que o usuário está na tela inicial de ativação da conta
                E clica no container "SMS"
                Quando o sistema está recebendo as informações da tela
                Então o componente container deverá estar em estado de carregamento

            Cenário:CT03 - Valido tela de token por SMS
                Dado que o usuário clicou no container "SMS"
                Quando o sistema recebe as informações da tela
                Então deverá ser enviado o token via SMS
                E deverá ser exibido o container com o título "Agora é só validar o seu acesso"
                E subtítulo "Para sua segurança, um código será enviado por SMS para o telefone com final {celular-final}."
                E abaixo do subtítulo deverá existir o botão "Não reconheço os dados"
                E abaixo do botão deverá existir a área para digitação do token com "5 dígitos"
                E abaixo do token deverá existir a mensagem "Para reenvio do código, aguarde {contagem} segundos."
                E deverá existir a mensagem "O código expira em {contagem} minutos"
                E abaixo do cronômetro de expiração deverá existir a mensagem "Não recebeu o código?"
                E abaixo da mensagem deverá existir o botão "Reenviar por SMS"

            Cenário:CT04 - Valido botão "Reenviar por SMS"
                Dado que o usuário está na tela de token SMS
                E a contagem regressiva de reenvio de token chegou a "0"
                Quando clica no botão "Reenviar por SMS"
                Então deverá ser enviado um novo token via SMS
                E a contagem regressiva deverá ser reiniciada

        Regra: Validação por e-mail
            Cenário:CT05 - Valido tela de token por e-mail
                Dado que o usuário está na tela inicial de ativação da conta
                Quando clica no container "E-mail"
                Então deverá ser enviado o token via e-mail
                E deverá ser exibido o container com o título "Agora é só validar o seu acesso"
                E subtítulo "Para sua segurança, um código será enviado para o e-mail {e-mail}"
                E abaixo do subtítulo deverá existir o botão "Não reconheço os dados"
                E abaixo do botão deverá existir a área para digitação do token com "5 dígitos"
                E abaixo do token deverá existir a mensagem "Para reenvio do código, aguarde {contagem} segundos."
                E deverá existir a mensagem "O código expira em {contagem} minutos"
                E abaixo do cronômetro de expiração deverá existir a mensagem "Não recebeu o código?"
                E abaixo da mensagem deverá existir o botão "Reenviar por e-mail"

            Cenário:CT06 - Valido botão "Reenviar por e-mail"
                Dado que o usuário está na tela de token e-mail
                E a contagem regressiva de reenvio de token chegou a "0"
                Quando clica no botão "Reenviar por e-mail"
                Então deverá ser enviado um novo token via e-mail
                E a contagem regressiva deverá ser reiniciada

        Cenário:CT07 - Valido tela "Não reconheço os dados"
            Dado que o usuário está na tela de token
            Quando clica no botão "Não reconheço os dados"
            Então deverá ser exibido o container com o título "Baixe o app para alterar os seus dados"
            E subtítulo "Para a sua segurança, grave sua biometria facial no aplicativo da Porto. É rápido, fácil e fundamental para evitar fraudes e proteger a sua identidade."
            E abaixo do subtítulo deverá existir os botões "AppStore", "GooglePlay"
            E abaixo dos botões deverá existir a mensagem "Tem dúvidas? Fale conosco!"
            E abaixo da mensagem deverá existir o botão "Acessar chat"

        Cenário:CT08 - Valido botão "Acessar chat" na tela "Não reconheço os dados"
            Dado que o usuáio está na tela não reconheço os dados
            Quando clica no botão "Acessar chat"
            Então deverá ser direcionado para o {chat-porto}

        Cenário:CT09 - Token incorreto
            Dado que o usuário está na tela de token
            Quando informa um token incorreto
            Então abaixo da área de digitação do token deverá ser exibida a mensagem "Código inválido. Verifique os dígitos e tente novamente."
            E o campo deverá assumir a cor "vermelha"

        Cenário:CT10 - Token expirado
            Dado que o usuário está na tela de token
            Quando informa um token expirado
            Então abaixo da área de digitação do token deverá ser exibida a mensagem "O código de acesso expirou"
            E o campo deverá assumir a cor "vermelha"

        Esquema do Cenário:CT11 - Bloqueio por token
            Dado que o usuário está na tela de token
    	    Quando informa um token incorreto pela "5" vez
            Então deverá ser exibido o container com o título "Você excedeu suas tentativas"
            E subtítulo "Por favor, entre em contato com a nossa Central de Relacionamento:"
            E abaixo do subtítulo deverá existir <telefone>, <mensagem>
            Exemplos:
                | telefone        | mensagem                                                                                                |
                | 4004 3600       | Capitais e regiões metropolitanas                                                                       |
                | 0800 727 7477   | Demais localidades                                                                                      |
                | 0800 701 5582   | Atendimento exclusivo para pessoas com deficiência auditiva, realizado somente por um telefone especial |
                | 55 11 3366 3126 | Central de relacionamento no exterior                                                                   |

        Esquema do Cenário:CT12 - Valido tela de criação de senha
            Dado que o usuário está na tela de token
            Quando informa o token correto
            Então deverá ser exibido o container com o título "Crie sua senha para concluir seu cadastro na Porto ID"
            E abaixo do título deverá existir os campos do tipo input "Senha", "Repita sua senha"
            E cada campo deverá conter o botão de exibir a senha
            E abaixo dos campos deverá existir a mensagem "Sua senha precisa ter, no mínimo:"
            E abaixo da mensagem deverá existir o checklist de requisitos contendo <icone-status>, <descricao>
            E abaixo do checklist deverá existir o botão "Salvar" desativado
            Exemplos:
                | icone          | descricao           |
                | {icone-status} | 8 caracteres        |
                | {icone-status} | 2 letras minúsculas |
                | {icone-status} | 2 números           |

        Cenário:CT13 - Validações de senha
            Dado que o usuário está na tela de criação de senha
            Quando inicia a digitação nos campos "Senha", "Repita sua senha"
            Então para cada requisito que a senha cumprir o respectivo {icone-status} deverá ser alterado para {ok}
            E ao cumprir todos os requisitos, o botão "Salvar" deverá ser habilitado

        Esquema do Cenário:CT14 - Valido tela de sucesso
            Dado que o usuário está na tela de criação de senha
            E informou uma senha cumprindo todos os requisitos
            E já aceitou o "Termo de Política de Privacidade"
            Quando clica no botão "Salvar"
            Então deverá ser exibido o container com <icone>, <titulo>, <mensagem>, <botao>
            Exemplos:
                | icone           | titulo                           | mensagem                                                                                                    | botao                       |
                | {icone-sucesso} | Sua conta foi criada com sucesso | Em instantes, iremos te redirecionar para o Portal do Cliente da Porto.\nCaso demore, é só clicar no botão. | Entrar no Portal do Cliente |

        Cenário:CT15 - Valido botão "Entrar no Portal do Cliente" na tela de sucesso
            Dado que o usuário está na tela de sucesso 
            Quando clica no botão "Entrar no Portal do Cliente"
            Então deverá ser direcionado para "Home-PDC"

        Cenário:CT16 - Usuário com "Termo de Política de Privacidade" por aceitar
            Dado que o usuário está na tela de criação de senha
            E informou uma senha cumprindo todos os requisitos
            E não aceitou o "Termo de Política de Privacidade"
            Quando clica no botão "Salvar"
            Então deverá ser exibido o container com o título "Termo de Política de Privacidade"
            E subtítulo "Olá, {nome}!\nPensando na sua segurança, pedimos que confira e aceite o termo para continuar."
            E abaixo do subtítulo deverá existir o checkbox "Li e concordo com a Política de Privacidade" desmarcado
            E o texto "Política de Privacidade" no checkbox deverá ser clicável
            E abaixo do checkbox deverá existir o botão "Entrar" desabilitado

        Cenário:CT17 - Valido aceite do "Termo de Política de Privacidade"
            Dado que o usuário está na tela de Termo de Política de Privacidade
            Quando marca o checkbox "Li e concordo com a Política de Privacidade"
            Então o botão "Entrar" deverá ser habilitado

        Cenário:CT18 - Valido botão "Entrar" na tela de Termo de Política de Privacidade
            Dado que o usuário está na tela de Termo de Política de Privacidade
            Quando clica no botão "Entrar"
            Então deverá ser direcionado para "Home-PDC"
