# language: pt
Funcionalidade: Validar funcionamento do modal Coberturas contratadas do Seguro Residência

    Contexto: Acesso a funcionalidade Coberturas contratadas
        Dado que o usuário se autenticou no PDC
        E acessou o produto "Seguro Residência"
        E selecionou a opção "Coberturas contratadas" disponível em "Menu > Apólices"

        Cenário:CT01 - Valido loading do modal coberturas contratadas
            Quando o sistema está recebendo as informações do modal
            Então os componentes abaixo do título do modal deverão estar em estado de carregamento

        Regra: Exibição mobile
            Esquema do Cenário:CT02 - Valido conteudo do modal Coberturas contratadas na visualização mobile
                Dado que o usuário está utilizando a visualização mobile
                Quando é exibido o modal com o o titulo "Coberturas contratadas"
                Então abaixo do título do modal deverá existir o container dados da apolice contendo <icone>, <titulo>, <mensagem>, <botao>
                E abaixo dos dados da apólice deverá existir uma lista de itens com título "Clique na cobertura, para saber mais:"
                E para cada cobertura ativa para a apólice selecionada deverá ser criado um item na lista contendo <icone>, <titulo>, <mensagem>, <botao-interativo>
                E na parte superior direita do componente deverá existir o botão {x} que irá fechar o modal
                Exemplos:
                    | icone           | titulo          | mensagem         | botao           |
                    | {icone-produto} | {Rua}, {Numero} | {produto-ramo}   | Alterar apólice |
                Exemplos:
                    | icone             | titulo           | mensagem              | botao-interativo |
                    | {icone-cobertura} | {cobertura-nome} | {cobertura-descricao} | {>}              |

            Cenário:CT03 - Valido scroll ao ultrapassar "4" coberturas
                Dado que o usuário está utilizando a visualização mobile
                E possui mais de "4" coberturas vinculadas à apólice selecionada
                Quando o carregamento das coberturas ocorre com sucesso
                Então deverá ser habilitado o scroll vertical do componente lista de coberturas

        Regra: Exibição web
            Esquema do Cenário:CT04 - Valido conteudo do modal Coberturas contratadas na visualização web
                Quando é exibido o modal com o o titulo "Coberturas contratadas"
                Então abaixo do título do modal deverá existir o container dados da apolice contendo <icone>, <titulo>, <mensagem>, <botao>
                E abaixo dos dados da apólice deverá existir uma lista de itens com título "Clique na cobertura, para saber mais:"
                E para cada cobertura ativa para a apólice selecionada deverá ser criado um item na lista contendo <icone>, <titulo>, <mensagem>, <botao-interativo>
                E na parte superior direita do componente deverá existir o botão {x} que irá fechar o modal
                Exemplos:
                    | icone           | titulo                        | mensagem         | botao           |
                    | {icone-produto} | {Rua}, {Numero}-{Cidade}-{UF} | {produto-ramo}   | Alterar apólice |
                Exemplos:
                    | icone               | titulo             | mensagem                | botao-interativo |
                    | {icone-assistencia} | {assistencia-nome} | {assistencia-descricao} | {Ver detahes >}  |

            Cenário:CT05 - Valido scroll ao ultrapassar "5" coberturas
                Dado que o usuário possui mais de "5" coberturas vinculadas à apólice selecionada
                Quando o carregamento das coberturas ocorre com sucesso
                Então deverá ser habilitado o scroll vertical do componente lista de coberturas

        Esquema do Cenário:CT06 - Valido exibição dos detalhes da cobertura
            Quando o usuário clica no item de alguma cobertura
            Então deverá ser exibido o modal de detalhes da cobertura com titulo "Detalhes da cobertura"
            E abaixo do título deverá existir um container com os dados da cobertura contendo <icone>, <titulo>, <mensagem>, <info1>, <info2>
            E abaixo do container com os dados da cobertura deverá existir o componente textarea com as informações completas da cobertura
            E abaixo do componente textarea deverá existir o botão "Avisar sinistro"
            E na parte superior direita do componente deverá existir o botão {x} que irá fechar o modal
            E na parte superior esquerda do componente deverá existir o botão {voltar} que irá retornar à listagem de coberturas
            Exemplos:
                | icone             | titulo           | mensagem           | info1                                   | info2                         |
                | {icone-cobertura} | {cobertura-nome} | {cobertura-resumo} | "Valor da franquia\n" +{franquia-valor} | "Indenização\n"+{indenizacao} |

        Esquema do Cenário:CT07 - Valido mensagem de erro ao carregar coberturas da apólice
            Quando ocorre falha ao carregar as coberturas vinculadas à apólice
            Então abaixo do título do modal deverão existir as informações <icone>, <titulo>, <mensagem>, <botao>
            Exemplos:
                | icone         | titulo                                     | mensagem                      | botao            |
                | {icone-aviso} | "Não foi possível carregar as informações" | "Por favor, tente novamente." | Tentar novamente |

        Esquema do Cenário:CT08 - Valido mensagem de erro ao carregar detalhes da cobertura
            Dado que o usuário clicou no item de alguma cobertura
            Quando ocorre falha ao carregar os detalhes da cobertura
            Então abaixo do título do modal deverão existir as informações <icone>, <titulo>, <mensagem>, <botao>
            Exemplos:
                | icone         | titulo                                     | mensagem                      | botao            |
                | {icone-aviso} | "Não foi possível carregar as informações" | "Por favor, tente novamente." | Tentar novamente |
