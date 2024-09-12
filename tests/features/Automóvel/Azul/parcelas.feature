# language: pt
Funcionalidade: Validar funcionamento da tela Parcelas do Seguro Auto-Azul

    Contexto: Acesso a funcionalidade Parcelas
        Dado que o usuário se autenticou no PDC
        E acessou o produto "Seguro Auto-Azul"
        E clicou no botão "Ver parcelas" na página inicial

        Cenário:CT01 - Valido loading
            Quando o sistema está recebendo as informações da tela
            Então todos os componentes abaixo do componente breadcrumb deverão estar em estado de carregamento

            Regra: Visualização web
                Esquema do Cenário:CT02 - Valido funcionamento do header
                    Quando o usuário navega entre as telas da aplicação
                    Então deve ser sempre exibido o componente header contendo <icone>, <botao>, <botao>, <icone-interativo>
                    Exemplos:
                        | icone               | botao                  | botao                               | icone-interativo |
                        | {icone-portoseguro} | "Dúvidas "+{icone-faq} | {icone-menu-usuario}+{nome-usuario} | {>}              |

                Esquema do Cenário:CT03 - Valido funcionamento do componente breadcrumb
                    Quando o usuário navega entre as telas da aplicação
                    Então abaixo do header deverá existir o componente breadcrumb contendo <botao>, <path>
                    Exemplos:
                        | botao    | path   |
                        | {voltar} | {path} |

            Regra: Visualização mobile
                Esquema do Cenário:CT04 - Valido funcionamento do header
                    Quando o usuário navega entre as telas da aplicação
                    Então deve ser sempre exibido o componente header contendo <icone>, <botao1>, <botao2>
                    Exemplos:
                        | icone               | botao1 | botao2         |
                        | {icone-portoseguro} | {faq}  | {menu-usuario} |

                Esquema do Cenário:CT05 - Valido funcionamento do componente breadcrumb
                    Quando o usuário navega entre as telas da aplicação
                    Então abaixo do header deverá existir o componente breadcrumb contendo <botao>, <mensagem>
                    Exemplos:
                        | botao    | mensagem |
                        | {voltar} | Voltar   |

                Cenário:CT06 - Valido reorganização dos componentes ao utilizar visualização mobile
                    Dado que o usuário está utlizando a visualização mobile
                    Quando o sistema recebe as informações da tela
                    Então os componentes "contador de valor total do seguro" e "container Costumer Satisfaction" deverão estar alinhados abaixo das informações de apólice

        Esquema do Cenário:CT07 - Valido exibição dos dados da apólice
            Quando o sistema recebe as informações da tela
            Então abaixo do componente breadcrumb deverá existir o container de informações da apólice contendo <icone>, <titulo>, <mensagem>, <botao>
            Mas caso o usuário possua apenas uma apólice o botão "Alterar apólice" não deverá existir no container dados da apólice
            Exemplos:
                | icone           | titulo                         | mensagem       | botao           |
                | {icone-produto} | {Marca} {Modelo}-{placa-final} | {produto-nome} | Alterar apólice |

        Esquema do Cenário:CT08 - Valido exibição da Parcela destaque
            Dado que o usuário possui alguma parcela vinculada à apólice selecionada
            Quando o sistema recebe as informações da tela
            Então abaixo das informações da apólice deverá existir o container com o título "Parcela destaque" contendo <parcela>, <status>, <pgto>, <venc>, <valor>, <aviso>
            Exemplos:
                | parcela                                       | status           | pgto                      | venc                 | valor                 | aviso                     |
                | "Parcela {parcela-numero} de {total-parcelas} | {parcela-status} | {parcela-forma-pagamento} | {parcela-vencimento} | "R$ "+{parcela-valor} | {mensagem-status-parcela} |

        Esquema do Cenário:CT09 - Valido exibição da lista Todas as parcelas
            Dado que o usuário possui mais de uma parcela vinculada à apólice selecionada
            Quando o sistema recebe as informações da tela
            Então abaixo da Parcela destaque deverá existir o componnente lista de itens com título "Todas as parcelas"
            E para cada uma das "3" parcelas mais recentes deverá ser criado um item na lista contendo <parcela>, <status>, <pgto>, <venc>, <valor>, <icone-interativo>
            Exemplos:
                | parcela                                       | status           | pgto                      | venc                 | valor                 | icone-interativo |
                | "Parcela {parcela-numero} de {total-parcelas} | {parcela-status} | {parcela-forma-pagamento} | {parcela-vencimento} | "R$ "+{parcela-valor} | {>}              |

        Esquema do Cenário:CT10 - Valido funcionamento do botão "Ver todas as parcelas"
            Dado que existem mais de "3" itens no componente Todas as parcelas
            E foi habilitado o botão "Ver todas as parcelas" no rodapé da página
            Quando o usuário clica no botão "Ver todas as parcelas"
            Então para cada parcela vinculada à apólice deverá ser criado um item na lista contendo <parcela>, <status>, <pgto>, <venc>, <valor>, <icone-interativo>
            Exemplos:
                | parcela                                       | status           | pgto                      | venc                 | valor                 | icone-interativo |
                | "Parcela {parcela-numero} de {total-parcelas} | {parcela-status} | {parcela-forma-pagamento} | {parcela-vencimento} | "R$ "+{parcela-valor} | {>}              |

        Cenário:CT11 - Valido funcionamento do contador de valor total do seguro
            Quando o sistema recebe as informações da tela
            Então à direita das informações da apólice deverá existir o container contendo os campos "Valor total do seguro", "Restante"
            E abaixo dos campos informativos deverá existir uma barra de progresso
            E a barra de progresso deverá ser preenchida de acordo com as informações de parcelas restantes

        Esquema do Cenário:CT12 - Valido funcionamento do container Costumer Satisfaction
            Quando o sistema recebe as informações da tela
            Então abaixo do contador de valor total do seguro deverá existir o container contendo <icone>, <mensagem>, <botao>
            Exemplos:
                | icone           | mensagem                                                                      | botao   |
                | {icone-estrela} | "O que você tem achado da experiência financeira de nosso Portal do Cliente?" | Avaliar |

        Regra: Pagamento com Cartão Porto
            Cenário:CT13 - Parcela com status vencida
                Dado que a forma de pagamento cadastrada é Cartão Porto
                Quando a parcela está com status Vencida
                Então a mensagem de aviso de status deverá ser "Parcela vencida. Pagando o valor total ou mínimo da fatura do seu Cartão Porto Bank, você não compromete o seguro."
                E deverá ser habilitado o botão "Pagar fatura"

            Cenário:CT14 - Parcela com status procesando
                Dado que a forma de pagamento cadastrada é Cartão Porto
                Quando a parcela está com status Processando
                Então a mensagem de aviso de status deverá ser "Processando pagamento da parcela.\nSe você já pagou, aguarde. A confirmação leva até 3 dias úteis após vencimento."
                E deverá ser habilitado o botão "Consultar cartão"

            Cenário:CT15 - Parcela com status a vencer
                Dado que a forma de pagamento cadastrada é Cartão Porto
                Quando a parcela está com status A vencer
                Então a mensagem de aviso de status deverá ser "Cobrança da parcela no seu Cartão Porto Bank. Se você já pagou, aguarde.\nA confirmação leva até 3 dias úteis após vencimento da parcela."
                E deverá ser habilitado o botão "Consultar cartão"

            Cenário:CT16 - Parcela com status futura
                Dado que a forma de pagamento cadastrada é Cartão Porto
                Quando a parcela está com status Futura
                Então a mensagem de aviso de status deverá ser "O pagamento do seu seguro está cadastrado no seu Cartão Porto Bank."
                E deverá ser habilitado o botão "Consultar cartão"

        Regra: Pagamento com Débito automático
            Cenário:CT17 - Parcela com status vencida
                Dado que a forma de pagamento cadastrada é Débito automático
                Quando a parcela está com status Vencida
                Então a mensagem de aviso de status deverá ser "Parcela vencida. O débito automático desta parcela não ocorreu. Para não comprometer o seu seguro, regularize o pagamento da sua parcela."
                E deverá ser habilitado o botão "Pagar parcela"

            Cenário:CT18 - Parcela com status procesando
                Dado que a forma de pagamento cadastrada é Débito automático
                Quando a parcela está com status Processando
                Então a mensagem de aviso de status deverá ser "Processando pagamento da parcela. Se você já pagou, é só aguardar.\nA confirmação leva até 3 dias úteis após vencimento."
                E deverá ser habilitado o botão "Pagar parcela"

            Cenário:CT19 - Parcela com status a vencer
                Dado que a forma de pagamento cadastrada é Débito automático
                Quando a parcela está com status A vencer
                Então a mensagem de aviso de status deverá ser "Cobrança por débito automático. Certifique-se de que o débito está autorizado em seu banco para que o pagamento ocorra sem complicações."
                E deverá ser habilitado o botão "Pagar parcela"

            Cenário:CT20 - Parcela com status ordem não enviada
                Dado que a forma de pagamento cadastrada é Débito automático
                Quando a parcela está com status Ordem não enviada
                Então a mensagem de aviso de status deverá ser "Cobrança por débito automático."
                E deverá ser habilitado o botão "Pagar parcela"

            Cenário:CT21 - Parcela com status futura
                Dado que a forma de pagamento cadastrada é Débito automático
                Quando a parcela está com status Futura
                Então a mensagem de aviso de status deverá ser "O pagamento do seu seguro está cadastrado em débito automático."
                E deverá ser habilitado o botão "Pagar parcela"

        Regra: Pagamento com Boleto
            Cenário:CT22 - Parcela com status vencida
                Dado que a forma de pagamento cadastrada é Boleto
                Quando a parcela está com status Vencida
                Então a mensagem de aviso de status deverá ser "Parcela vencida. Para não comprometer o seu seguro, regularize o pagamento da parcela."
                E deverá ser habilitado o botão "Pagar parcela"

            Cenário:CT23 - Parcela com status procesando
                Dado que a forma de pagamento cadastrada é Boleto
                Quando a parcela está com status Processando
                Então a mensagem de aviso de status deverá ser "Processando pagamento da parcela. Se você já pagou, é só aguardar.\nA confirmação leva até 3 dias úteis após pagamento."
                E deverá ser habilitado o botão "Pagar parcela"

            Cenário:CT24 - Parcela com status a vencer
                Dado que a forma de pagamento cadastrada é Boleto
                Quando a parcela está com status A vencer
                Então a mensagem de aviso de status deverá ser "Cobrança da parcela por boleto. Se você já pagou, aguarde. A confirmação leva até 3 dias úteis após pagamento da parcela."
                E deverá ser habilitado o botão "Pagar parcela"

            Cenário:CT25 - Parcela com status futura
                Dado que a forma de pagamento cadastrada é Boleto
                Quando a parcela está com status Futura
                Então a mensagem de aviso de status deverá ser "O pagamento do seu seguro está cadastrado em boleto."
                E deverá ser habilitado o botão "Pagar parcela"

        Regra: Pagamento com Outos cartões
            Cenário:CT26 - Parcela com status procesando
                Dado que a forma de pagamento cadastrada é Outros cartões
                Quando a parcela está com status Processando
                Então a mensagem de aviso de status deverá ser "Processando pagamento da parcela com vencimento em {parcela-vencimento}. Se você já pagou, é só aguardar.\nA confirmação leva até 7 dias úteis após vencimento."

            Cenário:CT27 - Parcela com status a vencer
                Dado que a forma de pagamento cadastrada é Outros cartões
                Quando a parcela está com status A vencer
                Então a mensagem de aviso de status deverá ser "Cobrança da parcela no seu cartão de crédito. Se você já pagou, aguarde. A confirmação leva até 7 dias úteis após vencimento da parcela."

            Cenário:CT28 - Parcela com status futura
                Dado que a forma de pagamento cadastrada é Outros cartões
                Quando a parcela está com status Futura
                Então a mensagem de aviso de status deverá ser "O pagamento do seu seguro está cadastrado no seu cartão de crédito."

        Esquema do Cenário:CT29- Valido modal de detalhes da parcela
            Dado que o sistema listou as parcelas vinculadas à apólice
            Quando o usuário clica no container de alguma parcela
            Então deverá ser exibido o modal com o título "Parcela {parcela-numero} de {total-parcelas}" contendo <venc>, <status>, <pgto>, <valor>, <aviso>
            E na parte superior direita do componente deverá existir o botão {x} que irá fechar o modal
            Exemplos:
                | venc                                | status           | pgto                      | valor                 | aviso                     |
                | "Vencimento\n"+{parcela-vencimento} | {parcela-status} | {parcela-forma-pagamento} | "R$ "+{parcela-valor} | {mensagem-status-parcela} |

        Esquema do Cenário:CT30 - Valido mensagem de erro
            Quando ocorre falha ao carregar alguma das informações da página
            Então na área da falha deverá ser apresentado o componente dialog contendo <icone>, <titulo>, <mensagem>, <botao>
            Exemplos:
                | icone         | titulo                                     | mensagem                     | botao            |
                | {icone-aviso} | "Não foi possível carregar as informações" | "Por favor tente novamente." | Tentar novamente |
            
        Esquema do Cenário:CT31 - Valido mensagem de erro ao carregar contador de valor total do seguro
            Quando ocorre falha ao carregar o contador de valor total do seguro
            Então na área da falha deverá ser apresentado o componente dialog contendo <icone>, <titulo>, <mensagem>, <botao>
            Exemplos:
                | icone         | titulo                                             | mensagem                                                                                           | botao            |
                | {icone-aviso} | "Poxa, estes dados estão indisponíveis no momento" | "Estamos trabalhando para voltar a exibi-los o quanto antes. Tente de novo ou retorne mais tarde." | Tentar novamente |
            
        Esquema do Cenário:CT32 - Valido mensagem de erro ao acessar detalhes da parcela
            Quando ocorre falha ao carregar os detalhes da parcela
            Então o conteúdo abaixo do título do modal deverá conter <icone>, <titulo>, <mensagem>, <botao>
            Exemplos:
                | icone         | titulo                                     | mensagem                     | botao            |
                | {icone-aviso} | "Não foi possível carregar as informações" | "Por favor tente novamente." | Tentar novamente |
           