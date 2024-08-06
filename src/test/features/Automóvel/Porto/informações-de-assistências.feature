# language: pt
Funcionalidade: Validar funcionamento do modal Solicitar assistência do Seguro Automóvel

    Contexto: Acesso a funcionalidade Solicitar assistência
        Dado que o usuário se autenticou no PDC
        E possui alguma apólice ativa de Seguro Automóvel
        E acessou o produto "Seguro Automóvel"
        E clicou na opção "Solicitar assistência" no scroll de Atalhos
        E selecionou algum item no modal Selecionar apólice

        Cenário:CT01 - Valido exibição do modal Solicitar assistência
            Quando o sistema recebe as informações do modal
            Então deverá ser exibido o modal com título "Solicitar Assistência"
            E na parte superior direita do componente deverá existir o botão {x} que irá fechar o modal

        Esquema do Cenário:CT02 - Valido exibição dos dados da apólice
            Quando o sistema recebe as informações do modal
            Então abaixo do título do modal deverá existir o container de informações da apólice contendo <icone>, <titulo>, <mensagem>, <botao>
            Exemplos:
                | icone           | titulo                         | mensagem       | botao           |
                | {icone-produto} | {Marca} {Modelo}-{placa-final} | {produto-nome} | Alterar apólice |

        Cenário:CT03 - Valido exibição das tabs "Automóvel", "Residencial"
            Quando o sistema recebe as informações do modal
            Então abaixo do título do modal deverão existir as guias "Automóvel", "Residencial"
            E a guia "Automóvel" deverá estar selecionada

        Esquema do Cenário:CT04 - Valido guia "Automóvel"
            Quando a guia "Automóvel" está selecionada
            Então abaixo das informações da apólice deverá existir o container com título "Você tem assistências disponíveis para seu automóvel" e subtítulo "Solicite um serviço assistencial no botão abaixo."
            E aabaixo do subtítulo deverá existir o dialog com a mensagem "Apólice vigente até {apolice-vigencia}"
            E abaixo do dialog deverá existir o container contendo <icone>, <titulo>, <mensagem>, <botao>
            E abaixo do container deverá existir a área com título "Mais serviços" contendo <icone>, <botao>
            Exemplos:
                | icone            | titulo                  | mensagem                                                                                                      | botao             |
                | {icone-whatsapp} | "Solicitar assistência" | "Aproveite para usar os serviços já disponíveis no WhatsApp Porto  \n\n Clique no botão abaixo para acessar:" | Acesse o WhatsApp |
            Exemplos:
                | icone           | botao          |
                | {icone-sinisro} | Meus sinistros |

        Cenário:CT05 - Valido botão "Acesse o WhatsApp"
            Quando o usuário clica no botão "Acesse o WhatsApp"
            Então deverá ocorrer o direcionamento para o {whatsapp-porto}

        Esquema do Cenário:CT06 - Valido mensagem de erro
            Quando ocorre falha ao carregar as informações do modal
            Então na área da falha deverá ser apresentado o componente dialog contendo <icone>, <titulo>, <mensagem>, <botao>
            Exemplos:
                | icone         | titulo                                     | mensagem                     | botao            |
                | {icone-aviso} | "Não foi possível carregar as informações" | "Por favor tente novamente." | Tentar novamente |