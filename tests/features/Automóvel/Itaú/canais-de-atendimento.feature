# language: pt
Funcionalidade: Validar funcionamento do modal Canais de Atendimento do Seguro Auto-Itaú

    Contexto:Acesso a funcionalidade Canais de atendimento
        Dado que o usuário se autenticou no PDC
        E acessou o produto "Seguro Auto-Itaú"
        E clicou na opção Canais de atendimento em "Atalhos"

    #  Cenário:CT01 - Valido loading
    #         Quando o sistema está recebendo as informações do modal
    #         Então os componentes abaixo do título do modal deverão estar em estado de carregamento

        Esquema do Cenário:CT02 - Valido exibição das informações
            Quando o carregamento das informações do modal ocorre com sucesso
            Então o modal deverá possuir o título "Central de relacionamento e SAC"
            E subtítulo "Dúvidas, informações, cancelamentos e reclamações"
            E abaixo do subtítulo deverão existir os <campos> com os <dados>
            E abaixo dos dados deverá existir o botão "Voltar"
            E na parte superior direita do componente deverá existir o botão {x} que irá fechar o modal
            Exemplos:
                | campos                                                                                                    | dados                                  |
                | "Capitais e regiões metropolitanas"                                                                       | "4004-3600"                            |
                | "Demais localidades"                                                                                      | "0800-727-7477"                        |
                | "Atendimento exclusivo para pessoas com deficiência auditiva, realizado somente por um telefone especial" | "0800-701-5582"                        |
                | "Central de relacionamento no exterior"                                                                   | "+55 11 3366-3126\nSujeito à cobrança" |
                | "SAC - Canal para continuidade de atendimentos com protocolos já abertos"                                 | "0800-727-2769"                        |
