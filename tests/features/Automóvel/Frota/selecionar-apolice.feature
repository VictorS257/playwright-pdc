# language: pt
Funcionalidade: Validar funcionamento do modal Selecionar apólice do Seguro Auto-Frota

    Contexto:Acesso a funcionalidade Seguro Auto-Frota
        Dado que o usuário se autenticou no PDC
        E possui mais de uma apólice ativa de Seguro Auto-Frota
        E acessou o produto "Seguro Auto-Frota"
        E acessou a opção "Selecionar apólice"
    
        Cenário:CT01 - Valido loading
            Quando o sistema está recebendo as informações do modal
            Então os componentes abaixo do título do modal deverão estar em estado de carregamento

        Esquema do Cenário:CT02 - Valido listagem de apólices
            Quando o carregamento do modal Selecionar apólice ocorre com sucesso
            Então o modal deverá possuir o título "Selecionar apólice"
            E para cada apólice ativa deverá ser criado um item na lista contendo <icone>, <info1>, <info2>, <icone-interativo>
            Exemplos:
                | icone           | info1                    | info2          | icone-interativo |
                | {icone-produto} | Apólice {apolice-numero} | {produto-nome} | {>}              |

        Esquema do Cenário:CT03 - Valido mensagem de erro no carregamento
            Dado que houve falha ao carregar as informações de apólices
            Então o conteúdo do componente lista de apólices deverá conter <icone>, <titulo>, <mensagem>, <botao>
            Exemplos:
                | icone          | titulo                                     | mensagem                     | botao            |
                | {aviso-reload} | "Não foi possível carregar as informações" | "Por favor tente novamente." | Tentar novamente |