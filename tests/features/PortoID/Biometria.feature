#language: pt
Funcionalidade: Valido a funcionalidade de biometria facial do PortoID

    Contexto: Usuário elegível para biometria
        Dado que o usuário possui PortoID cadastrado 
        E está elegível para realizar a biometria facial

        Cenário:CT01 - Valido tela de apresentação
            Quando o usuário clica no botão "Não reconheço os dados"
            Então deverá ser exibido o container com o título "Olá, {nome}!"
            E subtítuo "Para completar o seu cadastro, precisamos tirar uma foto para confirmar a sua identidade e atualizar os seus dados de contato."
            E abaixo do subtítulo deverá existir o botão "Confirmar identidade"

        Esquema do Cenário:CT02 - Valido tela de instruções
            Quando o usuário clica no botão "Confirmar identidade"
            Então deverá ser exibido o container com o título "Hora de tirar uma selfie"
            E subtítulo "Não se preocupe. Esta é uma verificação de segurança. Sua foto será usada apenas para validar sua identidade."
            E a mensagem "Aí vão algumas dicas:"
            E abaixo da mensagem deverá existir o <icone> com a <instrucao>
            E abaixo das instruções deverá existir a mensagem "Sem câmera no momento?"
            E deverá existir o botão "Faça pelo celular"
            E deverá existir o botão "Começar"
            Exemplos:
                | icone              | instrucao                                                 |
                | {icone-olho}       | Posicione a sua câmera na altura de seus olhos;           |
                | {icone-luz}        | Procure um lugar bem iluminado para garantir a qualidade; |
                | {icone-acessorios} | Retire qualquer tipo de acessórios, como boné e óculos.   |

        Esquema do Cenário:CT03 - Valido botão "Faça pelo celular"
            Dado que o usuário está na tela de instruções
            Quando clica no botão "Faça pelo celular"
            Então deverá ser exibido o container com o título "Validação pelo celular"
            E o subtítulo "Aponte a câmera do celular para o QR Code abaixo e faça a sua biometria pelo celular.\nAo concluir, nosso sistema fará a identificação automática para você continuar sua solicitação."
            E deverá ser exibido o QRcode com link para realização da biometria pelo celular
            E abixo o QRcode deverá existir o container com <icone>, <mensagem>
            Exemplos:
                | icone              | mensagem                                                     |
                | {icone-cronometro} | O prazo para tirar a sua foto (selfie) expira em {contagem}. |

        Cenário:CT04 - Valido loading web ao clicar em "Faça pelo celular"
            Dado que o usuário está na tela de instruções
            E está utilizando a visualização web
            Quando clica no botão "Faça pelo celular"
            Então deverá ser exibido o container com o título "Selfie em análise"
            E o subtítulo "Aguarde alguns segundos enquanto analisamos a imagem enviada."
            E abaixo do subtítulo deverá existir o {icone-loading}
            E abaixo do {icone-loading} deverá existir o botão "Cancelar"

        Cenário:CT05 - Valido botão "Cancelar"
            Dado que o usuário está na tela de loading web
            Quando clica no botão "Cancelar"
            Então o container deverá ser fechado 

        Esquema do Cenário:CT06 - Valido tela de permissão de acesso à câmera
            Dado que o acesso à câmera não está permitido
            Quando o usuário clica no botão "Começar" na tela de instruções
            Então deverá ser exibido o container com <icone>, <titulo>, <mensagem>, <botao>
            Exemplos:
                | icone          | titulo                                                | mensagem                                                                                  | botao     |
                | {icone-camera} | Precisamos de acesso à sua câmera para tirar sua foto | Para alterar os dados e tirar a foto, precisamos ter permissão para acessar a sua câmera. | Autorizar |

        Cenário:CT07 - Valido tela de introdução
            Dado que o usuário está na tela de permissão de acesso à câmera
            Quando clica no botão "Autorizar"
            Então deverá ser exibido o container com a mensagem "Prepare-se e posicione a sua câmera na altura de seus olhos"
            E abaixo da mensagem deverá existir o botão "Abrir a câmera"

        Cenário:CT08 - Valido tela de selfie
            Dado que o usuário está na tela de introdução
            Quando clica no botão "Abrir a câmera"
            Então deverá ser aberta a câmera com o frame de enquadramento do rosto
            E abaixo do frame deverá existir a {mensagem-dica}

        Cenário:CT09 - Valido tela de sucesso web
            Dado que o usuário está na tela de selfie
            E está utilizando a visualização web
            Quando a selfie é reconhecida
            Então deverá ser exibido o container com o {icone-sucesso}
            E abaixo do ícone deverá existir a mensagem "Identidade confirmada"

        Cenário:CT10 - Valido tela de sucesso mobile
            Dado que o usuário está na tela de selfie
            E está utilizando a visualização mobile
            Quando a selfie é reconhecida
            Então deverá ser exibido o container com o {icone-sucesso}
            E abaixo do ícone deverá existir o título "Identidade confirmada"
            E a mensagem "Agora você pode alterar seus dados pelo computador"

        Esquema do Cenário:CT11 - Valido tela de erro ao validar foto
            Dado que o usuário está na tela de selfie
            Quando a ocorre erro ao validar a selfie
            Então deverá ser exibido o container com <icone>, <titulo>, <botao>, <mensagem>, <link>
            Exemplos:
                | icone         | titulo                                           | botao           | mensagem                                                      | link           |
                | {icone-aviso} | Não conseguimos validar sua foto, vamos repetir? | Tirar nova foto | Se preferir, você pode alterar seus dados pelo chat da Porto. | Acessar o chat |

        Cenário:CT12 - Valido tela de erro ao identificar rosto
            Dado que o usuário está na tela de erro ao validar foto
            E clicou no botão "Tirar nova foto"
            Quando a ocorre erro ao validar a selfie
            Então deverá ser exibido o container com o título "Falha ao identificar seu rosto :("
            E subtítulo "Por favor, tente novamente mais tarde ou entre em contato pelo WhatsApp da Porto 11 3003 9303."
            E abaixo do subtítulo deverá existir o botão "Tentar novamente"

        Esquema do Cenário:CT13 - Valido tela de atualização de dados
            Quando o usuário realiza a biometria facial com sucesso
            Então deverá ser exibido o container com o título "Atualize seus dados de contato"
            E abaixo do título deverá existir o <componente> com a <mensagem>
            E ao lado do checkbox "Tenho nome social" deverá existir o botão "info"
            Exemplos:
                | componente | mensagem          |
                | input      | Nome completo     |
                | checkbox   | Tenho nome social |
                | input      | Celular (com DDD) |
                | input      | E-mail            |
                | botao      | Continuar         |

        Cenário:CT14 - Valido checkbox "Tenho nome social"
            Dado que o usuário está na tela de atualização de dados
            Quando marca o checkbox "Tenho nome social"
            Então deverá ser habilitado o campo input "Nome social"
            E abaixo do campo deverá existir o container com a mensagem "O nome social será o principal nome utilizado nos documentos do seguro, os dados fornecidos são de inteira responsabilidade do cliente."

        Cenário:CT15 - Valido botão de info do checkbox "Tenho nome social"
            Dado que o usuário está na tela de atualização de dados
            Quando passa o mouse sobre o botão de info do checkbox "Tenho nome social"
            Então deverá ser exibido o dialog com o título "Nome social"
            E subtítulo "É o nome pelo qual uma pessoa se identifica e como é reconhecida socialmente."

        Cenário:CT16 - Valido preenchimento dos campos
            Dado que o usuário está na tela de atualização de dados
            Quando inicia a digitação em algum campo input
            Então para cada campo preenchido do formulário deverá ser habilitado o botão {x} que irá limpar o campo
            
        Cenário:CT17 - Validações dos campos
            Dado que o usuário está na tela de atualização de dados
            Quando informa um valor incorreto em algum dos campos input
            Então abaixo do campo deverá ser exibida a mensagem "Informe um {campo-nome} válido"
            E o campo deverá assumir a cor vermelha
            E deverá ser exibido o {icone-aviso} à esquerda do botão {x}

        Esquema do Cenário:CT18 - Valido botão "Continuar" na tela de atualização de dados
            Dado que o usuário está na tela de atualização de dados
            E preencheu todos os campos corretamente
            E foi habilitado o botão "Continuar"
            Quando o usuário clica no botão "Continuar"
            Então deverá ser exbido o container contendo <icone>, <titulo>, <botao>
            Exemplos:
                | icone           | titulo                        | botao       |
                | {icone-sucesso} | Dados atualizados com sucesso | Fazer login |

        Cenário:CT19 - Valido botão "Fazer login" na tela de sucesso
            Dado que o usuário está na tela de sucesso
            Quando clica no botão "Fazer login"
            Então deverá ser direcionado para a tela inicial do PortoID sem dados preenchidos

        Cenário:CT20 - Usuário bloqueado pela Lexis
            Quando o usuário clica no botão "Não reconheço os dados"
            E a conta está bloqueada pela Lexis
            Então deverá ser exibido o container com o título "Acesso negado :("
            E a mensagem "Infelizmente, não foi possível autorizar seu acesso. Por favor, entre em contato pelo WhatsApp da Porto 11 3003 9303."
            E abaixo da mensagem deverá existir o botão "Abrir WhatsApp"

        Cenário:CT21 - Valido botão "Abrir WhatsApp" na tela de bloqueio
            Dado que o usuário está na tela de bloqueio Lexis
            Quando clica no botão "Abrir WhatsApp"
            Então deve ocorrer o direcionamento para o {whatsapp-porto}

        Esquema do Cenário:CT22 - Erros de validação de selfie
            Dado que o usuário está na tela de selfie
            Quando ocorre falha ao identificar a selfie
            Então para cada <erro> será exibido o container com <icone>, <titulo>, <mensagem>, <botao>, <info>, <link>
            Exemplos:
                | {icone-aviso} | #REFUSED    | Não conseguimos validar sua foto                 | Lembre-se:\nO CPF cadastrado precisa ser o seu, e a foto tem que ser tirada com a câmera do seu celular.\nVamos repetir? | Tirar nova foto | Se preferir, você pode alterar seus dados pelo chat da Porto.      | Acessar o chat   |
                | {icone-aviso} | #SUNGLASSES | Ops, não processamos sua foto                    | Parece que você está de óculos escuro, precisamos que você esteja sem o acessório, ok?                                   | Ok, vamos lá!   | Se preferir, você pode alterar seus dados pelo chat da Porto.      | Acessar o chat   |
                | {icone-aviso} | #CLOSER     | Ops, não processamos sua foto                    | Aproxime o rosto da câmera e o mantenha na área de captura por alguns segundos.                                          | Ok, vamos lá!   | Se preferir, você pode alterar seus dados pelo chat da Porto.      | Acessar o chat   |
                | {icone-aviso} | #AGAIN      | Não conseguimos validar sua foto, vamos repetir? |                                                                                                                          | Tirar nova foto | Se preferir, você pode alterar seus dados pelo chat da Porto.      | Acessar o chat   |
                | {icone-aviso} | #TILTED     | Ops, não processamos sua foto                    | Seu rosto está inclinado. Mantenha-o reto e olhe para a câmera por alguns segundos.                                      | Ok, vamos lá!   | Se preferir, você pode alterar seus dados pelo chat da Porto.      | Acessar o chat   |
                | {icone-aviso} | #LIGHTNING  | Ops, não processamos sua foto                    | O ambiente está pouco iluminado. Posicione o rosto em um ambiente com boa iluminação.                                    | Ok, vamos lá!   | Se preferir, você pode alterar seus dados pelo chat da Porto.      | Acessar o chat   |
                | {icone-aviso} | #REJECT     | Não conseguimos validar sua foto                 | Mas não se preocupe, você pode tirar sua foto em um outro momento.                                                       | Acessar o chat  | Mas não se preocupe, você pode tirar sua foto em um outro momento. | Tentar novamente |
                | {icone-aviso} | #SIDE       | Ops, não processamos sua foto                    | Seu rosto está de lado. Mantenha-o reto e olhe para a câmera por alguns segundos.                                        | Ok, vamos lá!   | Se preferir, você pode alterar seus dados pelo chat da Porto.      | Acessar o chat   |
                | {icone-aviso} | #CENTER     | Ops, não processamos sua foto                    | Centralize o rosto na área de captura e o mantenha nesta posição por alguns segundos.                                    | Ok, vamos lá!   | Se preferir, você pode alterar seus dados pelo chat da Porto.      | Acessar o chat   |
