# language: pt
Funcionalidade: Validar funcionamento do modal Solicitar assistência do Seguro Residência

    Contexto: Acesso a funcionalidade Solicitar assistência
        Dado que o usuário se autenticou no PDC
        E possui alguma apólice ativa de Seguro Residência
        E acessou o produto "Seguro Residência"
        E clicou na opção "Solicitar assistência" no scroll de Atalhos

        Cenário:CT01 - Valido exibição do modal Solicitar assistência
            Quando o sistema recebe as informações do modal
            Então deverá ser exibido o modal com título "Solicitar assistência"
            E na parte superior direita do componente deverá existir o botão {x} que irá fechar o modal

        Esquema do Cenário:CT02 - Valido exibição dos dados da apólice
            Quando o sistema recebe as informações do modal
            Então abaixo do título do modal deverá existir o container de informações da apólice contendo <icone>, <titulo>, <mensagem>, <botao>
            Exemplos:
                | icone           | titulo                        | mensagem       | botao           |
                | {icone-produto} | {Rua}, {Numero}-{Cidade}-{UF} | {produto-ramo} | Alterar apólice |

        Esquema do Cenário:CT03 - Valido o scroll Mais serviços
            Quando o sistema recebe as informações do modal
            Então abaixo do container com as informações de assistencia deverá existir o scroll horizontal com título "Mais serviços" contendo <icone>, <botao>
            Exemplos:
                | icone             | botao                     |
                | {icone-historico} | Histórico de solicitações |
                | {icone-sinistro}  | Meus sinistros            |

        Esquema do Cenário:CT04 - Valido comunicado sobre retorno
            Dado que o usuário possui assistência pendente vinculada à apólice
            Quando o sistema recebe as informações do modal
            Então acima do scroll Mais serviços deverá existir o componente dialog contendo <icone>, <titulo>, <mensagem>, <botao>
            Exemplos:
                | icone               | titulo                                       | mensagem                                                                         | botao             |
                | {icone-assistencia} | "Você realizou uma assistência recentemente" | "Acesse o seu histórico de solicitações caso você precise solicitar um retorno." | Acessar histórico |
        
        Regra: Sem auto / Com auto
            Esquema do Cenário:CT05 - Valido apólice com assistências disponíveis
                Dado que o usuário possui assistências disponíveis vinculadas à apólice
                Quando o sistema recebe as informações do modal
                Então abaixo das informações de apólice deverá existir o container com título "Você tem assistências disponíveis para essa residência"
                E abaixo do título deverá existir um gráfico indicando a quantidade de coberturas disponíveis do total de coberturas contratadas
                E à direita do gráfico deverá existir o container com título "Contratadas" contendo <icone>, <info>, <botao>
                E abaixo do gráfico deverá existir o dialog com a mensagem "Apólice vigente, até {apolice-vigencia}"
                E abaixo do dialog deverá existir o botão "Solicitar assistência"
                Exemplos:
                    | icone             | info             | botao |
                    | {icone-documento} | {qtd-coberturas} | {?}   |

            Esquema do Cenário:CT06 - Valido apólice com assistências extras
                Dado que o usuário possui alguma assistência extra contratada para a apólice
                Quando o sistema recebe as informações do modal
                Então abaixo do container "Contratadas" deverá existir o container "Extras" contendo <icone>, <info>, <botao>
                Exemplos:
                    | icone             | info                    | botao |
                    | {icone-documento} | {qtd-coberturas-extras} | {?}   |

            Esquema do Cenário:CT07 - Valido modal "Contratadas"
                Dado que o usuário possui assistências disponíveis vinculadas à apólice
                Quando clica no botão {?} no container "Contratadas"
                Então deverá ser exibido o componente dialog contendo <icone>, <titulo>, <mensagem>, <botao1>, <botao2>
                Exemplos:
                    | icone         | titulo                     | mensagem                                                                                                                                            | botao1 | botao2  |
                    | {icone-aviso} | "Assistências contratadas" | "Você adquiriu {qtd-coberturas} tipos de assistência residencial ao contratar o seu seguro e já usou {qtd-assistencias-utilizadas}, até o momento." | Fechar | Entendi |

            Esquema do Cenário:CT08 - Valido modal "Extra"
                Dado que o usuário possui alguma assistência extra contratada para a apólice
                Quando clica no botão {?} no container "Extra"
                Então deverá ser exibido o componente dialog contendo <icone>, <titulo>, <mensagem>, <botao1>, <botao2>
                Exemplos:
                    | icone         | titulo              | mensagem                                                                                                                                                              | botao1 | botao2  |
                    | {icone-aviso} | "Assistência extra" | "Mesmo que esgotem os auxílios residenciais que contratou, você ainda tem direito de solicitar, *exclusivamente pelo app*, mais 1 tipo de assistência para sua casa." | Fechar | Entendi |

            Cenário:CT09 - Valido apólie sem assistências disponíveis
                Dado que o usuário não possui assistências disponíveis para a apólice
                Quando o sistema recebe as informações do modal
                Então abaixo das informações de apólice deverá existir o container com título "Você já usou todas, mas pode contratar mais pela *Porto Serviço* e continuar usando nossas assistências."
                E abaixo do título deverá existir um gráfico indicando a quantidade de coberturas disponíveis do total de coberturas contratadas
                E abaixo do gráfico deverá existir o dialog com a mensagem "Apólice vigente, até {apolice-vigencia}"
                E abaixo do dialog deverá existir o botão "Solicitar pela Porto Serviço"
            
            Cenário:CT10 - Valido exibição das tabs "Automóvel", "Residencial"
                Dado que o usuário possui "seguro residência+auto"
                Quando o sistema recebe as informações do modal
                Então abaixo do título do modal deverão existir as guias "Automóvel", "Residencial"
                E a guia "Residencial" deverá estar selecionada

            Esquema do Cenário:CT11 - Valido guia "Automóvel"
                Dado que o usuário possui seguro residência+auto
                Quando seleciona a guia "Automóvel"
                Então abaixo das informações da apólice deverá existir o container com título "Você tem assistências disponíveis para seu automóvel"
                E aabaixo do subtítulo deverá existir o dialog com a mensagem "Apólice vigente até {apolice-vigencia}"
                E abaixo do dialog deverá existir o container contendo <icone>, <titulo>, <mensagem>, <botao>
                E abaixo do container deverá existir a área com título "Mais serviços" contendo <icone>, <botao>
                Exemplos:
                    | icone            | titulo                  | mensagem                                                                                                      | botao             |
                    | {icone-whatsapp} | "Solicitar assistência" | "Aproveite para usar os serviços já disponíveis no WhatsApp Porto  \n\n Clique no botão abaixo para acessar:" | Acesse o WhatsApp |
                Exemplos:
                    | icone           | botao          |
                    | {icone-sinisro} | Meus sinistros |

        Regra: Essencial
            Cenário:CT12 - Valido apólice com assistências disponíveis
                Dado que o usuário possui o produto Seguro-residência-Essencial
                E possui assistências disponíveis vinculadas à apólice
                Quando o sistema recebe as informações do modal
                Então abaixo das informações da apólice deverá existir o título "Você tem assistências disponíveis para essa residência"
                E abaixo do subtítulo deverá existir o dialog com a mensagem "Apólice vigente, até {apolice-vigencia}"
                E abaixo do dialog deverá existir o botão "Solicitar assistência"

            Cenário:CT13 - Valido apólice sem assistências disponíveis
                Dado que o usuário possui o produto Seguro-residência-Essencial
                E não possui assistências disponíveis para a apólice
                Quando o sistema recebe as informações do modal
                Então abaixo das informações da apólice deverá existir a mensagem "Você já usou todas, mas pode contratar mais pela *Porto Serviço* e continuar usando nossas assistências."
                E abaixo do subtítulo deverá existir o dialog com a mensagem "Apólice vigente, até {apolice-vigencia}"
                E abaixo do dialog deverá existir o botão "Solicitar assistência"

        Regra: Habiltual
            Cenário:CT14 - Valido apólice com valor disponível
                Dado que o usuário possui o produto Seguro-residência-Habitual
                E possui valor disponível para assistência
                Quando o sistema recebe as informações do modal
                Então abaixo das iformações da apólice deverá existir o título "Você tem valor disponível para assistências nessa residência"
                E abaixo do título deverá existir a mensagem "Use gratuitamente até R$ {valor-disponivel}"
                E abaixo da mensagem deverá existir o container com a barra de progresso indicando o valor já utilizado do total disponível
                E acima da barra de progresso deverão existir os dados "Valor utilizado\nR$ {valor-utilizado}", "Valor disponível\nR$ {valor-disponivel}"
                E abaixo da barra de progresso deverá existir o dialog com a mensagem "Apólice vigente, até {apolice-vigencia}"
                E abaixo do dialog deverá existir o botão "Solicitar assistência"

            Cenário:CT15 - Valido apólice sem valor disponível
                Dado que o usuário possui o produto Seguro-residência-Habitual
                E não possui valor disponível para assistência
                Quando o sistema recebe as informações do modal
                Então abaixo das iformações da apólice deverá existir a mensagem "Você já usou todo o valor disponível para assistências, mas pode contratar mais através da *Porto Serviço* e continuar usando nossos serviços."
                E abaixo da mensagem deverá existir o container com a barra de progresso indicando o valor já utilizado do total disponível
                E acima da barra de progresso deverão existir os dados "Valor utilizado\nR$ {valor-utilizado}", "Valor disponível\nR$ {valor-disponivel}"
                E abaixo da barra de progresso deverá existir o dialog com a mensagem "Apólice vigente, até {apolice-vigencia}"
                E abaixo do dialog deverá existir o botão "Contratar mais"

        Regra: Sinistros
            Cenário:CT16 - Valido apólice com assistência por sinistro
                Dado que o usuário possui o produto Seguro-residência-Sinistro
                Quando o sistema recebe as informações do modal
                Então abaixo das informações da apólice deverá existir a mensagem "Sua apólice contempla cobertura de assistências atreladas a sinistro"
                E abaixo da mensagem deverá existir o dialog com a mensagem "Apólice vigente, até {apolice-vigencia}"
                E abaixo do dialog deverá existir o botão "Abrir novo sinistro"

        Esquema do Cenário:CT17 - Valido mensagem de erro
            Quando ocorre falha ao carregar as informações de assistências
            Então na área da falha deverão ser apresentadas as informações <icone>, <titulo>, <mensagem>, <botao>
            Exemplos:
                | icone         | titulo                                     | mensagem                      | botao            |
                | {icone-aviso} | "Não foi possível carregar as informações" | "Por favor, tente novamente." | Tentar novamente |