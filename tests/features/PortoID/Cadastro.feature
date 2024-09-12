#language: pt
Funcionalidade: Valido tela de cadastro do PortoID

    Contexto: Usuário sem cadastro
        Dado que o usuário não está autenticado
        E acessa o PortoID

        Esquema do Cenário:CT01 - Tela de aviso de usuário não cadastrado
            Dado que o usuário informou um Porto ID sem cadastro no campo "Seu CPF/CNPJ é a Porto ID"
            Quando clica no botão "Continuar"
            Então deverá ser exibido o container com o título "Não identificamos os seus dados cadastrais "
            E subtítulo "Por medida de segurança, entre em contato com a Central de Relacionamento"
            E abaixo do subtítulo deverá existir <telefone>, <mensagem>
            E abaixo dos telefones deverá existir o botão "Fechar"
            Exemplos:
                | telefone        | mensagem                                                                                                |
                | 4004 3600       | Capitais e regiões metropolitanas                                                                       |
                | 0800 727 7477   | Demais localidades                                                                                      |
                | 0800 701 5582   | Atendimento exclusivo para pessoas com deficiência auditiva, realizado somente por um telefone especial |
                | 55 11 3366 3126 | Central de relacionamento no exterior                                                                   |

        Esquema do Cenário:CT02 - Valido tela de cadastro
            Quando o usuário clica no botão "Cadastre-se"
            Então deverá ser exibido o container com o título "Cadastre-se para criar sua Porto ID"
            E abaixo do título deverá existir o <componente> com a <mensagem>
            E ao lado do checkbox "Tenho nome social" deverá existir o botão "info"
            E abaixo acima do botão "Continuar" deverá existir a mensagem "Ao continuar, você concorda com os Termos de Uso e com a Política de Privacidade."
            E os trexos "Termos de Uso", "Política de Privacidade" do texto deverão ser clicáveis
            Exemplos:
                | componente | mensagem                                                          |
                | input      | Seu CPF/CNPJ será a Porto ID                                      |
                | input      | Nome completo                                                     |
                | checkbox   | Tenho nome social                                                 |
                | input      | Celular (com DDD)                                                 |
                | input      | E-mail                                                            |
                | checkbox   | Não quero receber comunicação sobre ofertas e promoções da Porto. |
                | botao      | Continuar                                                         |

        Cenário:CT03 - Valido checkbox "Tenho nome social"
            Dado que o usuário está na tela de cadastro
            Quando marca o checkbox "Tenho nome social"
            Então deverá ser habilitado o campo input "Nome social"
            E abaixo do campo deverá existir o container com a mensagem "O nome social será o principal nome utilizado nos documentos do seguro, os dados fornecidos são de inteira responsabilidade do cliente."

        Cenário:CT04 - Valido botão de info do checkbox "Tenho nome social"
            Dado que o usuário está na tela de cadastro
            Quando passa o mouse sobre o botão de info do checkbox "Tenho nome social"
            Então deverá ser exibido o dialog com o título "Nome social"
            E subtítulo "É o nome pelo qual uma pessoa se identifica e como é reconhecida socialmente."

        Cenário:CT05 - Valido preenchimento dos campos
            Dado que o usuário está na tela de cadastro
            Quando inicia a digitação em algum campo input
            Então para cada campo preenchido do formulário deverá ser habilitado o botão {x} que irá limpar o campo

        Cenário:CT06 - Validações dos campos
            Dado que o usuário está na tela de cadastro
            Quando informa um valor incorreto em algum dos campos input
            Então abaixo do campo deverá ser exibida a mensagem "Informe um {campo-nome} válido"
            E o campo deverá assumir a cor vermelha
            E deverá ser exibido o {icone-aviso} à esquerda do botão {x}

        Cenário:CT07 - Usuário informa um PortoID já cadastrado na tela de cadastro
            Dado que o usuário está na tela de cadastro
            Quando informa um PortoID já cadastrado no campo "Seu CPF/CNPJ será a Porto ID"
            Então abaixo do campo deverá ser exibida a mensagem "Dado já cadastrado. Faça o login ou recupere sua senha."
            E o campo deverá assumir a cor vermelha
            E deverá ser exibido o {icone-aviso} à esquerda do botão {x}
            E o trexo "Faça o login" da mensagem deverá ser clicável

        Cenário:CT08 - Valido clique no link "Faça o login" na mensagem do campo "Seu CPF/CNPJ será a Porto ID"
            Dado que o usuário está na tela de cadastro
            E informa um PortoID já cadastrado no campo
            Quando clica no link "Faça o login" na mensagem de erro do campo "Seu CPF/CNPJ será a Porto ID"
            Então deverá ser exibida a tela inicial do PortoID sem dados preenchidos

        Esquema do Cenário:CT09 - Valido botão "Continuar" na tela de cadastro
            Dado que o usuário está na tela de cadastro
            E preencheu todos os campos corretamente
            E foi habilitado o botão "Continuar"
            Quando o usuário clica no botão "Continuar"
            Então deverá ser exibido o container com o título "Escolha um método de validação"
            E abaixo do título deverá existir o container contendo <icone>, <titulo>, <mensagem>, <icone-interativo>
            E abaixo dos containers deverá existir o botão "Alterar dados de contato"
            Exemplos:
                | icone           | titulo   | mensagem                                          | icone-interativo |
                | {icone-celular} | "SMS"    | Vamos enviar um código para o telefone {celular}. | {>}              |
                | (icone-email)   | "E-mail" | Vamos enviar um código para {e-mail}              | {>}              |
#TODO
            Cenário:CT10 - Valido botão "Alterar dados de contato" na tela de token
                Dado que o usário está na tela de token de criação de conta
                Quando clica no botão "Alterar dados de contato"

            Regra: Validação por SMS
                Cenário:CT11 - Valido tela de token por SMS
                    Dado que o usuário está na tela de token de criação de conta
                    Quando clica no container "SMS"
                    Então deverá ser enviado o token via SMS
                    E deverá ser exibido o container com o título "Agora é só validar o seu acesso"
                    E subtítulo "Para sua segurança, um código será enviado por SMS para o telefone com final {celular-final}."
                    E abaixo do subtítulo deverá existir a área para digitação do token com "5 dígitos"
                    E abaixo do token deverá existir a mensagem "Para reenvio do código, aguarde {contagem} segundos."
                    E deverá existir a mensagem "O código expira em {contagem} minutos"
                    E abaixo do cronômetro de expiração deverá existir a mensagem "Não recebeu o código?"
                    E abaixo da mensagem deverá existir o botão "Reenviar por SMS"

                Cenário:CT12 - Valido botão "Reenviar por SMS"
                    Dado que o usuário está na tela de token SMS
                    E a contagem regressiva de reenvio de token chegou a "0"
                    Quando clica no botão "Reenviar por SMS"
                    Então deverá ser enviado um novo token via SMS
                    E a contagem regressiva deverá ser reiniciada

            Regra: Validação por e-mail
                Cenário:CT13 - Valido tela de token por e-mail
                    Dado que o usuário está na tela de token de criação de conta
                    Quando clica no container "E-mail"
                    Então deverá ser enviado o token via e-mail
                    E deverá ser exibido o container com o título "Agora é só validar o seu acesso"
                    E subtítulo "Para sua segurança, um código será enviado para o e-mail {e-mail}."
                    E abaixo do botão deverá existir a área para digitação do token com "5 dígitos"
                    E abaixo do token deverá existir a mensagem "Para reenvio do código, aguarde {contagem} segundos."
                    E deverá existir a mensagem "O código expira em {contagem} minutos"
                    E abaixo do cronômetro de expiração deverá existir a mensagem "Não recebeu o código?"
                    E abaixo da mensagem deverá existir o botão "Reenviar por e-mail"

                Cenário:CT14 - Valido botão "Reenviar por e-mail"
                    Dado que o usuário está na tela de token e-mail
                    E a contagem regressiva de reenvio de token chegou a "0"
                    Quando clica no botão "Reenviar por e-mail"
                    Então deverá ser enviado um novo token via e-mail
                    E a contagem regressiva deverá ser reiniciada

            Cenário:CT15 - Validação do token
                Dado que o usuário está na tela de token de criação de conta
                Quando informa o token corretamente
                Então deverá ser direcionado para a tela de criação de senha
#TODO
            Esquema do Cenário:CT16 - Erro de login
                Quando ocorre falha ao identificar o PortoID
                Então deverá ser exibido o container com <icone>, <titulo>, <mensagem>, <botao>
                Exemplos:
                    | icone         | titulo                         | mensagem                                       | botao            |
                    | {icone-aviso} | Houve um erro no nosso sistema | Por favor, tente novamente em alguns segundos. | Tentar novamente |

            Esquema do Cenário:CT17 - Erro de conexão
                Quando ocorre falha na conexão
                Então deverá ser exibido o container com <icone>, <titulo>, <mensagem>, <botao>
                Exemplos:
                    | icone         | titulo                                | mensagem                                 | botao            |
                    | {icone-aviso} | Parece que há um problema na conexãoa | Verifique sua conexão e tente novamente. | Tentar novamente |

            Esquema do Cenário:CT18 - Erro de sistema
                Quando ocorre falha no sistema
                Então deverá ser exibido o container com <icone>, <titulo>, <mensagem>, <botao>
                Exemplos:
                    | icone         | titulo                         | mensagem                                       | botao            |
                    | {icone-aviso} | Houve um erro em nosso sistema | Por favor, tente novamente em alguns segundos. | Tentar novamente |