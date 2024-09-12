# language: pt
Funcionalidade:Validar funcionamento da tela Meus sinistros do Seguro Residência na versão web

    Contexto: Acesso a tela Meus sinistros
        Dado que o usuário se autenticou no PDC
        E está utilizando a visualização web
        E acessou o produto "Seguro Residência"
        E clicou na opção "Meus sinistros" no scroll Atalhos
        E selecionou uma apólice no modal Selecionar apólice

        Cenário:CT01 - Valido loading
            Quando o sistema está recebendo as informações da tela
            Então todos os componentes abaixo do componente breadcrumb deverão estar em estado de carregamento

        Esquema do Cenário:CT02 - Valido funcionamento do header
            Quando o usuário navega entre as telas da aplicação
            Então deve ser sempre exibido o componente header contendo <icone>, <botao1>, <botao2>, <icone-interativo>
            Exemplos:
                | icone               | botao1                  | botao2                               | icone-interativo |
                | {icone-portoseguro} | "Dúvidas "+{icone-faq}  | {icone-menu-usuario}+{nome-usuario}  | {>}              |

        Esquema do Cenário:CT03 - Valido funcionamento do componente breadcrumb
            Quando o usuário navega entre as telas da aplicação
            Então abaixo do header deverá existir o componente breadcrumb contendo <botao>, <path>
            Exemplos:
                | botao    | path   |
                | {voltar} | {path} |

        Esquema do Cenário:CT04 - Valido exibição dos dados da apólice
            Quando o sistema recebe as informações da tela
            Então abaixo do componente breadcrumb deverá existir o container de informações da apólice contendo <icone>, <titulo>, <mensagem>, <botao>
            Exemplos:
                | icone           | titulo          | mensagem       | botao           |
                | {icone-produto} | {Rua}, {Numero} | {produto-ramo} | Alterar apólice |

        Esquema do Cenário:CT05 - Valido exibição do dialog "Quando abrir um sinistro?"
            Quando o sistema recebe as informações da tela
            Então abaixo do botão "Novo envio de documentos" deverá existir o componente dialog contendo <titulo>, <mensagem>, <botao>
            Exemplos:
                | titulo                      | mensagem                                                                                                                                     | botao      |
                | "Quando abrir um sinistro?" | "Em caso de danos, perdas ou acidentes que estejam cobertos pelo seguro. Desse modo, você acionará os reparos necessários ou a indenização." | Saiba mais |

        Cenário:CT06 - Valido botão "Abrir novo sinistro"
            Dado que o sistema recebeu as informações da tela
            E foi exibido o botão "Abrir novo sinistro" à direita as informações da apólice
            Quando o usuário clica no botão "Abrir novo sinistro" 
            Então deverá ser iniciado o fluxo "abertura-de-sinistro"

        Cenário:CT07 - Valido botão "Novo envio de documentos"
            Dado que o sistema recebeu as informações da tela
            E foi exibido o botão "Novo envio de documentos" à direita as informações da apólice
            Quando o usuário clica no botão "Novo envio de documentos" 
            Então deverá ser iniciado o fluxo "envio-de-documentos"

        Cenário:CT08 - Valido exibição do acompanhamento de sinistro
            Quando o sistema recebe as informações da tela
            Então abaixo das informações da apólice deverá existir o container com o título "Acompanhamento"
            E o conteúdo do container será preenchido de acordo com as informações de sinistro da apólice

        Esquema do Cenário:CT09 - Valido container Acompanhamento sem sinistros
            Quando o usuário não possui nenhum sinistro vinculado à apólice selecionada
            Então o container "Acompanhamento" deverá conter <icone>, <mensagem>
            Exemplos:
                | icone             | mensagem                        |
                | {icone-documento} | "Você não tem sinistro aberto." |

        Esquema do Cenário:CT10 - Valido container Acompanhamento com sinistro
            Quando o usuário possui algum sinistro vinculado à apólice selecionada
            Então o container "Acompanhamento" deverá conter <icone>, <titulo>, <info> do último sinistro
            E para cada evento no sinistro deverá ser criado um item no checklist contendo <icone>, <titulo>, <data>, <info>, <icone-interativo>
            E para cada item concluído do checklist deverá ser exibido o icone interativo que irá colapsar a parte inferior do componente
            Exemplos:
                | icone             | titulo           | info                           |
                | {icone-cobertura} | {cobertura-nome} | "Sinistro: "+{sinistro-numero} |
            Exemplos:
                | icone          | titulo        | data                                | info               | icone-interativo |
                | {icone-status} | {evento-nome} | {evento-data}+ " às " {evento-hora} | {evento-descricao} |   {>}            |
        
        Cenário:CT11 - Valido botão "Enviar documentos" no evento do sinistro
            Quando o sinistro possui status "Envio de documentos", "Novo envio de documentos"
            E abaixo da info do item foi exibido o botão "Enviar documentos"
            Quando o usuário clica no botão "Enviar documentos"
            Então deverá ser iniciado o fluxo "envio-de-documentos"

        Esquema do Cenário:CT12 - Valido lista de sinistros
            Quando o usuário possui mais de um sinistro vinculado à apólice selecionada
            Então abaixo do dialog Acompanhamento deverá existir a lista de sinistros com título "Sinistros"
            E para cada sinistro vinculado à apólice selecionada deverá ser criado um item minimizado na lista contendo <icone>, <titulo>, <status>, <info>, <icone-interativo>
            E deverá ser possível expandir o item para exibir o checklist completo do sinistro
            Exemplos:
                | icone             | titulo           | status            | info                           | icone-interativo |
                | {icone-cobertura} | {cobertura-nome} | {sinistro-status} | "Sinistro: "+{sinistro-numero} | {>}              |
        
        Esquema do Cenário:CT13 - Valido modal "Detalhes do sinistro"
            Dado que foi exibida a lista de sinistros da apólice
            Quando o usuário clica em algum item da lista de sinistros
            Então deverá ser exibido o modal com título "Detalhes do sinistro"
            E para cada evento no sinistro deverá ser criado um item no checklist contendo <icone>, <titulo>, <data>, <info>, <icone-interativo>
            E para cada item concluído do checklist deverá ser exibido o icone interativo que irá colapsar a parte inferior do componente
            E na parte superior direita do componente deverá existir o botão {x} que irá fechar o modal
            Exemplos:
                | icone          | titulo        | data                                | info               | icone-interativo |
                | {icone-status} | {evento-nome} | {evento-data}+ " às " {evento-hora} | {evento-descricao} |   {>}            |

        Cenário:CT14 - Valido botão "Enviar documentos" no item da lista de sinistros
            Quando o sinistro listado possui status "Envio de documentos", "Novo envio de documentos"
            Então abaixo do botão interativo deverá existir o botão "Enviar documentos"
            E abaixo da info do item deverá existir o dialog de aviso com a mensagem "Estamos aguardando você enviar a documentação até {data-limite}."

        Esquema do Cenário:CT15 - Valido funcionamento do modal "Selecionar apólice" com apólices vencidas
            Dado que o usuário possui mais de uma apólice de Seguro Residência
            E o usuário possui alguma apólice vencida
            Quando o usuário clica no botão Alterar apólice
            Então deverá ser exibido o modal com o título "Selecionar apólice"
            E para cada apólice ativa deverá ser criado um item na lista contendo <icone>, <titulo>, <mensagem>, <icone-interativo>
            E abaixo da lista de apólices ativas deverá existir o botão "Ver apólices vencidas"
            E na parte superior direita do componente deverá existir o botão {x} que irá fechar o modal
            Exemplos:
                | icone           | titulo                        | mensagem         | icone-interativo |
                | {icone-produto} | {Rua}, {Numero}-{Cidade}-{UF} | {produto-ramo}   | {>}              |

        Esquema do Cenário:CT16 - Valido funcionamento do botão "Ver apólices vencidas"
            Dado que o usuário possui mais de uma apólice de Seguro Residência
            E o usuário possui alguma apólice vencida
            Quando o usuário clica no botão "Ver apólices vencidas"
            Então deverá ser exibido o modal com o título "Apólices vencidas"
            E para cada apólice vencida deverá ser criado um item na lista contendo <icone>, <titulo>, <mensagem>, <icone-interativo>
            E na parte superior esquerda do componente deverá existir o botão {voltar} que irá retornar à lista de apólices
            E na parte superior direita do componente deverá existir o botão {x} que irá fechar o modal
            Exemplos:
                | icone           | titulo                       | mensagem                                            | icone-interativo |
                | {icone-produto} | {rua} {numero}-{cidade}-{uf} | {produto-ramo}+" - Vencida em {apolice-vencimento}" | {>}              |

        Esquema do Cenário:CT17 - Valido modal "Quando abrir um sinistro?"
            Dado que o sistema recebeu as informações da tela
            Quando o usuário clica no botão "Saiba mais" no dialog Quando abrir um sinistro?
            Então deverá ser exibido o modal com título "Quando abrir um sinistro?" contendo <img>, <msg>
            E abaixo da mensagem deverá existir o componente lista de itens com o título "Aqui estão algumas situações em que você pode precisar acionar o seguro:"
            E para cada cobertura vinculada à apólice será criado um item na lista contendo <icone>, <titulo>, <mensagem>
            E na parte superior esquerda do componente deverá existir o botão {voltar} que irá retornar à lista de apólices
            E na parte superior direita do componente deverá existir o botão {x} que irá fechar o modal
            E na lateral inferior direita do modal deverá existir o botão flutuante "Abrir um novo sinistro"
            Exemplos:
                | icone             | titulo           | mensagem              |
                | {icone-cobertura} | {cobertura-nome} | {cobertura-descricao} |
            Exemplos:
                | img                         | msg                                                                                                                                                                                                                                                                    |
                | {img-apresentacao-sinistro} | "A abertura de sinistro é o procedimento necessário para registrar danos, perdas, ou acidentes relacionados à sua apólice. Para assistências como chaveiro, eletricista, encanador, dentre outros, volte para o menu Residencial e clique em "solicitar assistência"." |

        Esquema do Cenário:CT18 - Valido mensagem de erro 
            Quando ocorre falha ao carregar alguma das informações da página
            Então na área da falha deverão ser apresentadas as informações <icone>, <titulo>, <mensagem>, <botao>
            Exemplos:
                | icone         | titulo                                     | mensagem                      | botao            |
                | {icone-aviso} | "Não foi possível carregar as informações" | "Por favor, tente novamente." | Tentar novamente |