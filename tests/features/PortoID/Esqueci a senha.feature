#Language: pt
Funcionalidade: Valido tela "Esqueci minha senha" do Porto ID

    Contexto: Usuário com senha cadastrada
        Dado que o usuário possui senha criada
        E está na tela de senha

        Cenário:CT01 - Valido tela "Esqueci minha senha"
            Quando o usuário clica no botão "Esqueci minha senha"
            Então deverá ser exibido o container com o título "Esqueci minha senha"
            E subtítulo "Escolha um método de verificação para redefinir sua senha."
            E abaixo do título deverá existir o container contendo <icone>, <titulo>, <mensagem>, <icone-interativo>
            E abaixo dos containers deverá existir o botão "Não reconheço os dados"
            Exemplos:
                | icone           | titulo   | mensagem                                                             | icone-interativo |
                | {icone-celular} | "SMS"    | Vamos enviar um código para o telefone terminado em {celular-final}. | {>}              |
                | (icone-email)   | "E-mail" | Vamos enviar um código para {email}.                                 | {>}              |

        Regra: Validação por SMS
            Cenário:CT02 - Valido tela de token por SMS
                Dado que o usuário está na tela "Esqueci minha senha"
                Quando clica no container "SMS"
                Então deverá ser enviado o token via SMS
                E deverá ser exibido o container com o título "Esqueci minha senha"
                E subtítulo "Enviamos um código de verificação para o celular {celular}."
                E abaixo do subtítulo deverá existir a área para digitação do token com "5 dígitos"
                E abaixo do token deverá existir a mensagem "Para reenvio do código, aguarde {contagem} segundos."
                E deverá existir a mensagem "O código expira em {contagem} minutos"
                E abaixo do cronômetro de expiração deverá existir a mensagem "Não recebeu o código?"
                E abaixo da mensagem deverá existir o botão "Reenviar por SMS"

            Cenário:CT03 - Valido botão "Reenviar por SMS"
                Dado que o usuário está na tela de token SMS
                E a contagem regressiva de reenvio de token chegou a "0"
                Quando clica no botão "Reenviar por SMS"
                Então deverá ser enviado um novo token via SMS
                E a contagem regressiva deverá ser reiniciada

        Regra: Validação por e-mail
            Cenário:CT04 - Valido tela de token por e-mail
                Dado que o usuário está na tela "Esqueci minha senha"
                Quando clica no container "E-mail"
                Então deverá ser enviado o token via e-mail
                E deverá ser exibido o container com o título "Esqueci minha senha"
                E subtítulo "Enviamos um código de verificação para o e-mail {e-mail}."
                E abaixo do botão deverá existir a área para digitação do token com "5 dígitos"
                E abaixo do token deverá existir a mensagem "Para reenvio do código, aguarde {contagem} segundos."
                E deverá existir a mensagem "O código expira em {contagem} minutos"
                E abaixo do cronômetro de expiração deverá existir a mensagem "Não recebeu o código?"
                E abaixo da mensagem deverá existir o botão "Reenviar por e-mail"

            Cenário:CT05 - Valido botão "Reenviar por e-mail"
                Dado que o usuário está na tela de token e-mail
                E a contagem regressiva de reenvio de token chegou a "0"
                Quando clica no botão "Reenviar por e-mail"
                Então deverá ser enviado um novo token via e-mail
                E a contagem regressiva deverá ser reiniciada

        Cenário:CT06 - Valido tela "Não reconheço os dados"
            Dado que o usuário está na tela "Esqueci minha senha"
            Quando clica no botão "Não reconheço os dados"
            Então deverá ser exibido o container com o título "Baixe o app para alterar os seus dados"
            E subtítulo "Para a sua segurança, grave sua biometria facial no aplicativo da Porto. É rápido, fácil e fundamental para evitar fraudes e proteger a sua identidade."
            E abaixo do subtítulo deverá existir os botões "AppStore", "GooglePlay"
            E abaixo dos botões deverá existir a mensagem "Tem dúvidas? Fale conosco!"
            E abaixo da mensagem deverá existir o botão "Acessar chat"

        Cenário:CT07 - Valido botão "Acessar chat" na tela "Não reconheço os dados"
            Dado que o usuáio está na tela não reconheço os dados
            Quando clica no botão "Acessar chat"
            Então deverá ser direcionado para o {chat-porto}

        Cenário:CT08 - Token incorreto
            Dado que o usuário está na tela de token
            Quando informa um token incorreto
            Então abaixo da área de digitação do token deverá ser exibida a mensagem "Código inválido. Verifique os dígitos e tente novamente."
            E o campo deverá assumir a cor "vermelha"

        Cenário:CT09 - Token expirado
            Dado que o usuário está na tela de token
            Quando informa um token expirado
            Então abaixo da área de digitação do token deverá ser exibida a mensagem "O código de acesso expirou"
            E o campo deverá assumir a cor "vermelha"

        Esquema do Cenário:CT10 - Bloqueio por token
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

        Esquema do Cenário:CT11 - Valido tela Cadastrar senha
            Dado que o usuário está na tela de token
            Quando informa um token correto
            Então deverá ser exibido o container com o título "Cadastrar senha"
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

        Cenário:CT12 - Validações de senha
            Dado que o usuário está na tela "Cadastrar senha"
            Quando inicia a digitação nos campos "Senha", "Repita sua senha"
            Então para cada requisito que a senha cumprir o respectivo {icone-status} deverá ser alterado para {ok}
            E ao cumprir todos os requisitos, o botão "Salvar" deverá ser habilitado

        Esquema do Cenário:CT13 - Valido tela de sucesso
            Dado que o usuário está na tela "Cadastrar senha"
            E informou uma senha cumprindo todos os requisitos
            E já aceitou o "Termo de Política de Privacidade"
            Quando clica no botão "Salvar"
            Então deverá ser exibido o container com <icone>, <titulo>, <mensagem>, <botao>
            Exemplos:
                | icone           | titulo                                  | mensagem                                                                                                    | botao                       |
                | {icone-sucesso} | Processo de senha concluída com sucesso | Em instantes, iremos te redirecionar para o Portal do Cliente da Porto.\nCaso demore, é só clicar no botão. | Entrar no Portal do Cliente |

        Cenário:CT14 - Valido botão "Entrar no Portal do Cliente" na tela de sucesso
            Dado que o usuário está na tela de sucesso 
            Quando clica no botão "Entrar no Portal do Cliente"
            Então deverá ser direcionado para "Home-PDC"

        Cenário:CT15 - Usuário com "Termo de Política de Privacidade" por aceitar
            Dado que o usuário está na tela "Cadastrar senha"
            E informou uma senha cumprindo todos os requisitos
            E não aceitou o "Termo de Política de Privacidade"
            Quando clica no botão "Salvar"
            Então deverá ser exibido o container com o título "Termo de Política de Privacidade"
            E subtítulo "Olá, {nome}!\nPensando na sua segurança, pedimos que confira e aceite o termo para continuar."
            E abaixo do subtítulo deverá existir o checkbox "Li e concordo com a Política de Privacidade" desmarcado
            E o texto "Política de Privacidade" no checkbox deverá ser clicável
            E abaixo do checkbox deverá existir o botão "Entrar" desabilitado

        Cenário:CT16 - Valido aceite do "Termo de Política de Privacidade"
            Dado que o usuário está na tela de Termo de Política de Privacidade
            Quando marca o checkbox "Li e concordo com a Política de Privacidade"
            Então o botão "Entrar" deverá ser habilitado

        Cenário:CT17 - Valido botão "Entrar" na tela de Termo de Política de Privacidade
            Dado que o usuário está na tela de Termo de Política de Privacidade
            Quando clica no botão "Entrar"
            Então deverá ser direcionado para "Home-PDC"

        Esquema do Cenário:CT18 - Erro de envio de token
            Dado que o usuário está na tela de selecionar o meio de recebimento do token
            Quando ocorre erro ao enviar o token
            Então deverá ser exibido o container com <icone>, <titulo>, <mensagem>, <botao>
            Exemplos:
                | icone         | titulo                         | mensagem                                       | botao            |
                | {icone-aviso} | Houve um erro em nosso sistema | Por favor, tente novamente em alguns segundos. | Tentar novamente |

        Esquema do Cenário:CT19 - Primeiro erro de validação de token
            Dado que o usuário está na tela de token
            Quando ocorre erro ao validar o token
            Então deverá ser exibido o container com <icone>, <titulo>, <mensagem>, <botao>
            Exemplos:
                | icone         | titulo                         | mensagem                                       | botao            |
                | {icone-aviso} | Houve um erro em nosso sistema | Por favor, tente novamente em alguns segundos. | Tentar novamente |

        Esquema do Cenário:CT20 - Segundo erro de validação de token
            Dado que o usuário está no Primeiro erro de validação de token
            E clica no botão "Tentar novamente"
            Quando ocorre erro ao validar o token
            Então deverá ser exibido o container com <icone>, <titulo>, <mensagem>, <botao>
            Exemplos:
                | icone         | titulo                                       | mensagem                                                  | botao            |
                | {icone-aviso} | Ainda estamos com problemas em nosso sistema | Por favor, aguarde e tente novamente em alguns instantes. | Tentar novamente |

        Esquema do Cenário:CT21 - Terceiro erro de validação de token
            Dado que o usuário está no Segundo erro de validação de token
            E clica no botão "Tentar novamente"
            Quando ocorre erro ao validar o token
            Então deverá ser exibido o container com <icone>, <titulo>, <mensagem>, <botao>
            Exemplos:
                | icone         | titulo                      | mensagem                                  | botao  |
                | {icone-aviso} | Nosso sistema está instável | Ocorreu um erro ao buscar o código token. | Voltar |

        Cenário:CT22 - Valido botão "Voltar" no Terceiro erro de validação de token
            Dado que o usuário está no Terceiro erro de validação de token
            Quando clica no botão "Voltar"
            Então deverá ser direcionado para "Home-PDC"

        Esquema do Cenário:CT23 - Erro de conexão ao criar senha
            Dado que o usuário está na tela de Criação de senha
            Quando ocorre falha na conexão 
            Então deverá ser exibido o container com <titulo>, <mensagem>, <botao>
            Exemplos:
                | titulo                                         | mensagem                                  | botao            |
                | Parece que há algum problema com a sua conexão | Verifique a sua conexão e tente novamente | Tentar novamente |

        Esquema do Cenário:CT24 - Sessão expirada
            Dado que o usuário está na tela de Criação de senha
            Quando o token está expirado
            Então deverá ser exibido o container com <titulo>, <mensagem>, <botao>
            Exemplos:
                | titulo             | mensagem                                         | botao     |
                | Sua sessão expirou | Solicite um novo token para reiniciar sua sessão | Reiniciar |

        Cenário:CT25 - Valido botão "Reiniciar" na tela de sessão expirada
            Dado que o usuário está na tela de sessão expirada
            Quando clica no botão "Reiniciar"
            Então deverá ser direcionado para a tela de selecionar o meio de recebimento do token

        Esquema do Cenário:CT26 - Primeiro erro de criação de senha
            Dado que o usuário está na tela de Criação de senha
            E informou uma senha dentro dos requisitos
            Quando ocorre falha ao salvar a senha
            Então deverá ser exibido o container com <icone>, <titulo>, <mensagem>, <botao>
            Exemplos:
                | icone         | titulo                         | mensagem                                       | botao            |
                | {icone-aviso} | Houve um erro em nosso sistema | Por favor, tente novamente em alguns segundos. | Tentar novamente |

        Esquema do Cenário:CT27 - Segundo erro de criação de senha
            Dado que o usuário está no Primeiro erro de criação de senha
            Quando clica no botão "Tentar novamente"
            Então deverá ser exibido o container com <icone>, <titulo>, <mensagem>, <botao>
            Exemplos:
                | icone         | titulo                                       | mensagem                                                  | botao            |
                | {icone-aviso} | Ainda estamos com problemas em nosso sistema | Por favor, aguarde e tente novamente em alguns instantes. | Tentar novamente |

        Esquema do Cenário:CT28 - Terceiro erro de criação de senha
            Dado que o usuário está no Segundo erro de criação de senha
            Quando clica no botão "Tentar novamente"
            Então deverá ser exibido o container com <icone>, <titulo>, <mensagem>, <botao>
            Exemplos:
                | icone         | titulo                      | mensagem                                       | botao               |
                | {icone-aviso} | Nosso sistema está instável | Por favor, tente novamente em alguns instantes | Voltar para o login |

        Cenário:CT29 - Valido botão "Voltar para o login" no Terceiro erro de criação de senha
            Dado que o usuário está no Terceiro erro de criação de senha
            Quando clica no botão "Voltar para o login"
            Então deverá ser exibida a tela inicial do PortoID sem dados preenchidos