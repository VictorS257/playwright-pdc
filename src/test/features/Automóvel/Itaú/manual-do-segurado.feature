# language: pt
Funcionalidade: Validar funcionamento do modal Manual do segurado do Seguro Auto-Itaú

    Contexto:Acesso a funcionalidade Apoio jurídico
        Dado que o usuário se autenticou no PDC
        E acessou o produto "Seguro Auto-Itaú"
#Validar caminho        E clicou na opção...

    #  Cenário:CT01 - Valido loading
    #         Quando o sistema está recebendo as informações do modal
    #         Então os componentes abaixo do título do modal deverão estar em estado de carregamento

        Esquema do Cenário:CT02 - Valido exibição das informações
            Quando o carregamento das informações do modal ocorre com sucesso
            Então o modal deverá possuir o título "Manual do segurado"
            E subtítulo "Consulte informações sobre seu seguro"
            E para cada manual será criado um container contendo <icone>, <titulo>, <link>, <icone-interativo>
            E na parte superior direita do componente deverá existir o botão {x} que irá fechar o modal
            Exemplos:
                | icone             | titulo    | link          | icone-interativo |
                | {icone-documento} | {Manuais} | {manual-nome} | {>}              |

        Esquema do Cenário:CT03 - Valido mensagem de erro
            Dado que houve falha ao carregar as informações do modal
            Então o conteúdo do componente deverá conter <icone>, <titulo>, <mensagem>, <botao>
            Exemplos:
                | icone         | titulo                                     | mensagem                     | botao            |
                | {aviso-aviso} | "Não foi possível carregar as informações" | "Por favor tente novamente." | Tentar novamente |