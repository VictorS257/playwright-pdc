# language: pt
Funcionalidade: Validar funcionamento do modal Acompanhe sua solicitação do Seguro Residência

    Contexto: Acesso a funcionalidade Acompanhar solicitação
        Dado que o usuário se autenticou no PDC
        E possui alguma solicitação de assistência vinculada à apólice
        E acessou o produto "Seguro Residência"
        E clicou na opção "Acompanhar solicitação" na tela de Confirmação de solicitação de assistência

        Cenário:CT01 - Valido loading
            Quando o sistema está recebendo as informações do modal
            Então os componentes abaixo do título do modal deverão estar em estado de carregamento

        Cenário:CT02 - Valido exibição do modal Acompanhe sua solicitação
            Quando o sistema recebe as infomrações do modal
            Então o modal deverá possuir o título "Acompanhe sua solicitação"
            E na parte superior direita do componente deverá existir o botão {x} que irá fechar o modal
            E na parte inferior do componente deverão existir as opções "Detalhes da solicitação", "Cancelar solicitação"

        Cenário:CT03 - Valido componente checklist resumido
            Quando o sistema recebe as informações do modal
            Então abaixo do título do modal deverá existir um checklist simplificado indicando a etapa atual da solicitação
            E para cada evento na solicitação de assistência será criada uma etapa no checklist
            E o título do checklist deverá ser a etapa atual do processo
            E abaixo do contador de etapa deverá existir o botão "Exibir resumo"
            
        Regra: Visualização mobile
            Cenário:CT04 - Valido drawer "Exibir resumo" na visualização mobile
                Dado que o usuário está utilizando a visualização mobile
                Quando clica no botão "Exibir resumo" exibido no checklist de acompanhamento de solicitação
                Então deverá ser exibido o drawer com move in up com título "Resumo"
                E na parte superior direita do componente deverá existir o botão {x} que irá fechar o drawer
                E para cada evento na solicitação será criado um item no checklist contendo <icone>, <titulo>, <info>
                Exemplos:
                    | icone                | titulo       | info              |
                    | {icone-numero-etapa} | {etapa-nome} | {etapa-descricao} |

        Regra: Visualização web
            Cenário:CT05 - Valido drawer "Exibir resumo" na visualização web
                Dado que o usuário está utilizando a visualização web
                Quando clica no botão "Exibir resumo" exibido no checklist de acompanhamento de solicitação
                Então deverá ser exibido o modal com título "Detalhes da solicitação"
                E na parte superior direita do componente deverá existir o botão {x} que irá fechar o drawer
                E na parte superior esquerda do componente deverá existir o botão {<-} que irá retornar à página anterior
                E para cada evento na solicitação será criado um item no checklist contendo <icone>, <titulo>, <info>
                Exemplos:
                    | icone                | titulo       | info              |
                    | {icone-numero-etapa} | {etapa-nome} | {etapa-descricao} |

        Esquema do Cenário:CT06 - Valido drawer "Detalhes da solicitação"
            Dado que o sistema recebeu as informações do modal
            Quando o usuário clica no container "Detalhes da solicitação"
            Então o container deverá ser expandido exibindo <icone>, <titulo>, <info>
            Exemplos:
                | icone                    | titulo             | info                        |
                | {icone-produto}          | {Rua}, {Numero}    | {Cidade}-{UF}-{complemento} |
                | {icone-tipo-assistencia} | {assistencia-tipo} | {assistencia-item}          |

        Cenário:CT07 - Valido botão "Cancelar solicitação"
            Dado que o sistema recebeu as informações do modal
            Quando o usuário clica no botão "Cancelar solicitação"
            Então deverá ser direcionado para o fluxo "cancelamento-de-assistencia"

        Cenário:CT08 - Valido detalhamento da etapa "Assistência agendada"
            Dado que a solicitação de assistência está na etapa "Assistência agendada"
            Quando o usuário clica no botão "Exibir resumo" no checklist
            Então a etapa atual deverá ser "Assistência agendada"
            E abaixo do nome da etapa deverá existir a mensagem "Sua assistência está programada"

        Cenário:CT09 - Valido container Previsão de atendimento na etapa "Assistência agendada"
            Dado que a solicitação de assistência está na etapa "Assistência agendada"
            Quando o sistema recebe as informações do modal
            Então abaixo do checklist deverá existir o container com o título "Previsão de atendimento"
            E abaixo do título do container deverá ser informado {dia}, {faixa-horario} da previsão de atendimento
            E abaixo das informações de data e horário deverá existir uma barra de progresso

        Esquema do Cenário:CT10 - Valido exibição das informações do prestador na etapa "Assistência agendada"
            Dado que a solicitação de assistência está na etapa "Assistência agendada"
            Quando o sistema recebe as informações do modal
            Então abaixo do container Previsão de atendimento deverá existir o formulário preenchido com os dados <campo>, <dado>
            Exemplos:
                | campo                  | dado                      |
                | Prestador responsável: | {prestador-nome}          |
                | RG:                    | {prestador-rg}            |
                | Placa:                 | {prestador-veiculo-placa} |

        Esquema do Cenário:CT11 - Valido dialog Senha na etapa "Assistência agendada"
            Dado que a solicitação de assistência está na etapa "Assistência agendada"
            Quando o sistema recebe as informações do modal
            Então abaixo das informações do prestador deverá existir o dialog contendo <icone>, <titulo>, <mensagem>
            Exemplos:
                | icone         | titulo                       | mensagem                                                             |
                | {icone-senha} | "Senha: "{assistencia-senha} | "Para sua segurança, solicite que o prestador confirme esse código." |
 
        Cenário:CT12 - Valido detalhamento da etapa "Assistência solicitada"
            Dado que a solicitação de assistência está na etapa "Assistência solicitada"
            Quando o usuário clica no botão "Exibir resumo" no checklist
            Então a etapa atual deverá ser "Assistência solicitada"
            E abaixo do nome da etapa deverá existir a data da solicitação 
            E abaixo da data da solicitação deverá existir a mensagem "Protocolo: {protocolo-numero}"

        Cenário:CT13 - Valido exibição do componente de mapa
            Dado que a solicitação de assistência está na etapa "Assistência solicitada" ,"Prestador a caminho", "Prestador chegou"
            Quando o sistema recebe as informações do modal
            Então abaixo do checklist deverá existir o componente mapa indicando a rota do prestador até o destino
            E o container de Previsão de atendimento deverá estar sobreposto ao componente mapa

        Cenário:CT14 - Valido detalhamento da etapa "Prestador a caminho"
            Dado que a solicitação de assistência está na etapa "Prestador a caminho"
            Quando o usuário clica no botão "Exibir resumo" no checklist
            Então a etapa atual deverá ser "Prestador a caminho"
            E abaixo do nome da etapa deverá existir o nome do prestador

        Cenário:CT15 - Valido detalhamento da etapa "Prestador chegou"
            Dado que a solicitação de assistência está na etapa "Prestador chegou"
            Quando o usuário clica no botão "Exibir resumo" no checklist
            Então a etapa atual deverá ser "Prestador chegou"
            E abaixo do nome da etapa deverá existir a mensagem "Informe a senha de 4 dígitos"

        Cenário:CT16 - Valido detalhamento da etapa "Serviço concluido"
            Dado que a solicitação de assistência está na etapa "Serviço concluido"
            Quando o usuário clica no botão "Exibir resumo" no checklist
            Então a etapa atual deverá ser "Serviço concluido"

        Esquema do Cenário:CT17 - Valido tela de conclusão da solicitação
            Dado que a solicitação de assistência está na etapa "Serviço concluído"
            Então abaixo do checklist deverá existir a mensagem "Sua solicitação de assistência foi concluída com sucesso"
            E acima da mensagem deverá existir o {icone-sucesso}
            E abaixo da mensagem deverá existir o container contendo <icone>, <titulo>, <info>
            E abaixo do container de data deverá existir o dialog contendo <icone>, <mensagem>, <botao>
            E o botão "Cancelar solicitação" deixará de existir
            Exemplos:
                | icone              | titulo                                    | info              |
                | {icone-calendario} | {Dia da semana} - {dia} de {mês} de {ano} | {hora ou período} |
            Exemplos:
                | icone           | mensagem                                                                          | botao   |
                | {icone-estrela} | "O que você tem achado da experiência de assistência do nosso Portal do Cliente?" | Avaliar |

        Esquema do Cenário:CT18 - Valido mensagem de erro
            Quando ocorre falha ao carregar alguma das informações do modal
            Então na área da falha deverão ser apresentadas as informações <icone>, <titulo>, <mensagem>, <botao>
            Exemplos:
                | icone         | titulo                                     | mensagem                      | botao            |
                | {icone-aviso} | "Não foi possível carregar as informações" | "Por favor, tente novamente." | Tentar novamente |