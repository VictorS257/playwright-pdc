    # language: pt
    Funcionalidade: Validar funcionamento do modal Coberturas contratadas do Seguro Auto-Itaú

        Contexto:Acesso a funcionalidade Coberturas contratadas
            Dado que o usuário se autenticou no PDC
            E acessou o produto "Seguro Auto-Itaú"
            E selecionou a opção "Coberturas contratadas" disponível em "Menu > Apólices"

            Cenário:CT01 - Valido loading do modal coberturas contratadas
                Quando o sistema está recebendo as informações do modal
                Então os componentes abaixo do título do modal deverão estar em estado de carregamento

            Esquema do Cenário:CT02 - Valido conteúdo do modal Coberturas contratadas
                Quando é exibido o modal com o o titulo "Coberturas contratadas"
                Então abaixo do título do modal deverá existir o container dados da apolice contendo <icone>, <titulo>, <mensagem>, <botao>
                E abaixo dos dados da apólice deverá existir uma lista de itens com título "Clique em cada uma das coberturas abaixo para saber mais."
                E para cada cobertura ativa para a apólice selecionada deverá ser criado um item na lista contendo <icone>, <titulo>, <mensagem>, <botao-interativo>
                E na parte superior direita do componente deverá existir o botão {x} que irá fechar o modal
                Mas caso o usuário possua apenas uma apólice o botão "Alterar apólice" não deverá existir no container dados da apólice
                Exemplos:
                    | icone           | titulo                         | mensagem       | botao           |
                    | {icone-produto} | {Marca} {Modelo}-{placa-final} | {produto-nome} | Alterar apólice |
                Exemplos:
                    | icone               | titulo             | mensagem                | botao-interativo |
                    | {icone-assistencia} | {assistencia-nome} | {assistencia-descricao} | {Ver detahes >}  |
                
            Esquema do Cenário:CT03 - Valido exibição dos detalhes da cobertura
                Quando o usuário clica no item de alguma cobertura
                Então deverá ser exibido o modal de detalhes da cobertura com titulo {cobertura-nome}
                E abaixo do título deverá existir o container dados da apólice
                E abaixo do container dados da apólice deverá existir um container com os dados da cobertura contendo <titulo>, <mensagem>
                E abaixo do container com os dados da cobertura deverá existir o botão "Avisar sinistro"
                E na parte superior direita do componente deverá existir o botão {x} que irá fechar o modal
                E na parte superior esquerda do componente deverá existir o botão {voltar} que irá retornar à listagem de coberturas
                Exemplos:
                    | titulo           | mensagem             |
                    | {cobertura-nome} | {cobertura-detalhes} |

            Esquema do Cenário:CT04 - Valido mensagem de erro ao carregar coberturas da apólice
                Quando ocorre falha ao carregar as coberturas vinculadas à apólice
                Então abaixo do título da lista de coberturas deverá ser apresentado o componente dialog contendo <icone>, <titulo>, <mensagem>, <botao>
                Exemplos:
                    | icone         | titulo                                     | mensagem                     | botao            |
                    | {icone-aviso} | "Não foi possível carregar as informações" | "Por favor tente novamente." | Tentar novamente |

            Esquema do Cenário:CT05 - Valido mensagem de erro ao carregar detalhes da cobertura
                Dado que o usuário clicou no item de alguma cobertura
                Quando ocorre falha ao carregar os detalhes da cobertura
                Então abaixo do título do modal de detalhes da cobertura deverá ser apresentado o componente dialog contendo <icone>, <titulo>, <mensagem>, <botao>
                Exemplos:
                    | icone         | titulo                                     | mensagem                     | botao            |
                    | {icone-aviso} | "Não foi possível carregar as informações" | "Por favor tente novamente." | Tentar novamente |
