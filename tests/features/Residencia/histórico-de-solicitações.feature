# language: pt
Funcionalidade: Valido tela Histórico de solicitações do Seguro Residência

    Contexto: Acesso a funcionalidade Histórico de solicitações
        Dado que o usuário se autenticou no PDC
        E possui alguma solicitação de assistência vinculada à apólice
        E acessou o produto "Seguro Residência"
        E clicou no botão "Acompanhar solicitação" na tela de sucesso na solicitação de assistência
    
        Regra: Visualização web
            Esquema do Cenário:CT01 - Valido funcionamento do header
                Quando o usuário navega entre as telas da aplicação
                Então deve ser sempre exibido o componente header contendo <icone>, <botao1>, <botao2>, <icone-interativo>
                Exemplos:
                    | icone               | botao1                  | botao2                               | icone-interativo |
                    | {icone-portoseguro} | "Dúvidas "+{icone-faq}  | {icone-menu-usuario}+{nome-usuario}  | {>}              |

            Esquema do Cenário:CT02 - Valido funcionamento do componente breadcrumb
                Quando o usuário navega entre as telas da aplicação
                Então abaixo do header deverá existir o componente breadcrumb contendo <botao>, <path>
                Exemplos:
                    | botao    | path   |
                    | {voltar} | {path} |

        Regra: Visualização mobile
            Esquema do Cenário:CT03 - Valido funcionamento do header
                Quando o usuário navega entre as telas da aplicação
                Então deve ser sempre exibido o componente header contendo <icone>, <botao1>, <botao2>
                Exemplos:
                    | icone               | botao1 | botao2          |
                    | {icone-portoseguro} | {faq}  | {menu-usuario}  |

            Esquema do Cenário:CT04 - Valido funcionamento do componente breadcrumb
                Quando o usuário navega entre as telas da aplicação
                Então abaixo do header deverá existir o componente breadcrumb contendo <botao>, <mensagem>
                Exemplos:
                    | botao    | mensagem |
                    | {voltar} | Voltar   |

        Esquema do Cenário:CT05 - Valido exibição da lista de solicitações de assistência
            Quando o sistema recebe as informações da tela
            Então abaixo do componente breadcrumb deverá existir a lista de itens com o título "Histórico de solicitações" e o subtítulo "Selecione a solicitação para ver os detalhes."
            E para cada assistência vinculada à apólice deverá ser criado um container com <icone>, <status>, <titulo>, <info1>, <info2>, <icone-interativo>
            Exemplos:
                | icone                    | status               | titulo             | info1              | info2              | icone-interativo |
                | {icone-tipo-assistencia} | {assistencia-status} | {assistencia-tipo} | {assistencia-item} | {data-assistencia} | {>}              |

        Cenário:CT06 - Valido click em alguma das assistências
            Quando o usuário clica no container de alguma assistência
            Então deverá ser direcionado para o fluxo "acompanhamento-de-assistencia"

        Esquema do Cenário:CT07 - Valido mensagem de erro
            Quando ocorre falha ao carregar alguma das informações do modal
            Então na área da falha deverão ser apresentadas as informações <icone>, <titulo>, <mensagem>, <botao>
            Exemplos:
                | icone         | titulo                                     | mensagem                      | botao            |
                | {icone-aviso} | "Não foi possível carregar as informações" | "Por favor, tente novamente." | Tentar novamente |

        Esquema do Cenário:CT08 - Valido mensagem de erro sistema indisponível
            Quando ocorre falha na conexão com o servidor
            Então a área do modal deve conter <icone>, <titulo>, <mensagem>, <botao>
            Exemplos:
                | icone             | titulo                                       | mensagem                                                                                                | botao            |
                | {aviso-triangulo} | "Nosso sistema está indisponível no momento" | "Estamos trabalhando para que volte a funcionar o quanto antes. Por favor, tente novamente mais tarde." | Voltar ao início |
        