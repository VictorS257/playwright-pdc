# language: pt
Funcionalidade: Validar funcionamento do modal Solicitar assistência do Seguro Auto-Frota

    Contexto: Acesso a funcionalidade Solicitar assistência
        Dado que o usuário se autenticou no PDC
        E possui alguma apólice ativa de Seguro Auto-Frota
        E acessou o produto "Seguro Auto-Frota"
        E clicou na opção "Solicitar assistência" no scroll de Atalhos

        Cenário:CT01 - Valido exibição do modal Solicitar assistência
            Quando o sistema recebe as informações do modal
            Então deverá ser exibido o modal com título "Solicitar Assistência"
            E na parte superior direita do componente deverá existir o botão {x} que irá fechar o modal

        Esquema do Cenário:CT02 - Valido exibição dos dados da apólice
            Quando o sistema recebe as informações do modal
            Então abaixo do título do modal deverá existir o container de informações da apólice contendo <icone>, <titulo>, <mensagem>, <botao>
            Mas caso o usuário possua apenas uma apólice o botão "Alterar apólice" não deverá existir no container dados da apólice
            Exemplos:
                | icone           | info1                    | info2          |
                | {icone-produto} | Apólice {apolice-numero} | {produto-nome} |

        Esquema do Cenário:CT03 - Valido exibição das informações do modal
            Quando o sistema recebe as informações do modal
            Então abaixo das informações da apólice deverá existir o container com título "Central de atendimento 24h" contendo os <campos> com as <infos>
            E abaixo do container deverá existir a mensagem "Apólice vigente até {vigencia}"
            E abaixo da mensagem deverá existir o container contendo <icone>, <titulo>, <mensagem>, <botao>
            E abaixo do container deverá existir a área com título "Mais serviços" contendo <icone>, <botao>
            Exemplos:
                | campos                                   | infos              |
                | "+55 11 3004-6221"                       | "+55 11 3004-6221" |
                | Demais localidades                       | 0800-727-2810      |
                | Atendimento MERCOSUL                     | +55 11 336-3189    |
                | Informações, reclamações e cancelamentos | 0800-727-2766      |
                | Ouvidoria                                | 0800-727-1184      |
                | Exclusivo para deficientes auditivos     | 0800-727-8736      |
            Exemplos:
                | icone            | titulo                | mensagem                                                                                                | botao             |
                | {icone-whatsapp} | Solicitar assistência | Aproveite para usar os serviços já disponíveis no WhatsApp Porto.\nClique no botão abaixo para acessar: | Acesse o WhatsApp |
            Exemplos:
                | icone           | botao          |
                | {icone-sinisro} | Meus sinistros |

        Cenário:CT04 - Valido botão "Acesse o WhatsApp"
            Quando o usuário clica no botão "Acesse o WhatsApp"
            Então deverá ocorrer o direcionamento para o {whatsapp-porto}

        Esquema do Cenário:CT05 - Valido mensagem de erro
            Quando ocorre falha ao carregar as informações do modal
            Então na área da falha deverá ser apresentado o componente dialog contendo <icone>, <titulo>, <mensagem>, <botao>
            Exemplos:
                | icone         | titulo                                     | mensagem                     | botao            |
                | {icone-aviso} | "Não foi possível carregar as informações" | "Por favor tente novamente." | Tentar novamente |

        Esquema do Cenário:CT06 - Valido mensagem de erro sistema indisponível
            Quando ocorre falha na conexão com o servidor
            Então a área do modal deve conter <icone>, <titulo>, <mensagem>, <botao>
            Exemplos:
                | icone             | titulo                                       | mensagem                                                                                                | botao            |
                | {aviso-triangulo} | "Nosso sistema está indisponível no momento" | "Estamos trabalhando para que volte a funcionar o quanto antes. Por favor, tente novamente mais tarde." | Voltar ao início |
        