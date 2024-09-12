# language: pt
Funcionalidade: Validar funcionamento do modal Selecionar apólice do Seguro Residência

    Contexto:Acesso a funcionalidade Seguro Residência
        Dado que o usuário se autenticou no PDC
        E possui mais de uma apólice ativa de Seguro Residência
        E acessou o produto "Seguro Residência"
        E acessou o modal "Selecionar apólice"
    
        Cenário:CT01 - Valido loading
            Quando o sistema está recebendo as informações do modal
            Então os componentes abaixo do título do modal deverão estar em estado de carregamento

        Esquema do Cenário:CT02 - Valido listagem de apólices
            Quando o carregamento do modal Selecionar apólice ocorre com sucesso
            Então o modal deverá possuir o título "Selecionar apólice"
            E para cada apólice ativa deverá ser criado um item na lista contendo <icone>, <titulo>, <mensagem>, <icone-interativo>
            Exemplos:
                | icone           | titulo          | mensagem       | icone |
                | {icone-produto} | {Rua}, {Numero} | {produto-ramo} | {>}   |

        Regra:Mobile - Valido funcionamento do scroll ao ultrapassar "9" itens no mobile
            Esquema do Cenário:CT03 - Valido funcionamento do scroll
                Dado que o usuário possui mais de "9" apólices ativas de "Seguro Residência"
                E está utilizando a visualização mobile
                Quando o carregamento do modal Selecionar apólice ocorre com sucesso
                Então deverá existir o componente scroll vertical com o título "Selecionar apólice"
                E para cada apólice ativa deverá ser criado um item no carrosel contendo <icone>, <titulo>, <mensagem>, <icone-interativo>
                Exemplos:
                    | icone           | titulo          | mensagem       | icone |
                    | {icone-produto} | {Rua}, {Numero} | {produto-ramo} | {>}   |
            
        Regra:Web - Valido funcionamento do scroll ao ultrapassar "8" itens na web
            Esquema do Cenário:CT04 - Valido funcionamento do scroll
                Dado que o usuário possui mais de "8" apólices ativas de "Seguro Residência"
                E está utilizando a visualização web
                Quando o carregamento do modal Selecionar apólice ocorre com sucesso
                Então deverá existir o componente scroll vertical com o título "Selecionar apólice"
                E para cada apólice ativa deverá ser criado um item no carrosel contendo <icone>, <titulo>, <mensagem>, <icone-interativo>
                Exemplos:
                    | icone           | titulo          | mensagem       | icone |
                    | {icone-produto} | {Rua}, {Numero} | {produto-ramo} | {>}   |

        Cenário:CT05 - Valido funcionamento da seleção de apólice
            Dado o carregamento da lista de apólices ocorreu com sucesso
            Quando o usuário clica em algum dos itens da lista
            Então deverá ser selecionada a apólice em questão

        Esquema do Cenário:CT06 - Valido mensagem de erro no carregamento
            Dado que houve falha ao carregar as informações de apólices
            Então abaixo do título do modal deverão existir as informações <icone>, <titulo>, <mensagem>, <botao>
            Exemplos:
                | icone          | titulo                                     | mensagem                      | botao            |
                | {aviso-reload} | "Não foi possível carregar as informações" | "Por favor, tente novamente." | Tentar novamente |