# language: pt
Funcionalidade: Validar funcionamento do modal Cancelar assistência do Seguro Residência

    Contexto: Acesso a funcionalidade Cancelar assistência
        Dado que o usuário se autenticou no PDC
        E possui alguma solicitação de assistência vinculada à apólice
        E acessou o produto "Seguro Residência"
        E clicou na opção "Cancelar assistência" na tela de Acompanhamento da solicitação
    
        Cenário:CT01 - Valido modal Cancelar assistência
            Quando o modal Cancelar assistência é exibido
            Então o título do modal deverá ser "Cancelar assistência"
            E abaixo da mensagem deverá existir o textbox com placeholder "Motivo do cancelamento"
            E abaixo do textbox deverão existir os botões "Cancelar assistência", "Fechar"
            E na parte superior direita do componente deverá existir o botão {x} que irá fechar o modal

        Esquema do Cenário:CT03 - Valido tela de sucesso no cancelamento
            Dado que o usuário preenche o campo "Motivo do cancelamento"
            Quando o usuário clica no botão "Cancelar assistência"
            Então abaixo do título do modal deverá existir o {icone-sucesso}
            E abaixo do {icone-sucesso} deverá existir a mensagem "Sua solicitação foi cencelada com sucesso"
            E logo abaixo deverá existir o container contendo <icone>, <titulo>, <info>
            E abaixo do container deverá existir a mensagem "Protocolo\n +{protocolo-cancelamento-numero}"
            E à direita da mensagem com o número do protocolo deverá existir o botão "Copiar"
            E logo abaixo deverá existir o botão "Voltar para o início"
            Exemplos:
                | icone              | titulo                                    | info              |
                | {icone-calendario} | {Dia da semana} - {dia} de {mês} de {ano} | {hora ou período} |

        Esquema do Cenário:CT04 - Valido mensagem de erro ao tentar avançar sem preencher o campo "Motivo"
            Quando o usuário clica no botão "Cancelar assistência" sem preencher o campo "Motivo do cancelamento"
            Então deverá ser exibida a mensagem "Campo obrigatório" abaixo do campo
            E deverá ser apresentado o componente dialog contendo <icone>, <mensagem>, <botao>
            E o componente deverá ser fechado automaticamente após "2s"
            Exemplos:
                | icone           | mensagem                                              | botao |
                | {icone-sucesso} | "Preencha os campos obrigatórios antes de continuar." | {X}   |

        Esquema do Cenário:CT05 - Valido mensagem de sucesso ao copiar protocolo
            Dado que o usuário está na tela de "sucesso no cancelamento"
            Quando clica no botão "Copiar"
            Então deverá ser apresentado o componente dialog contendo <icone>, <mensagem>, <botao>
            E o componente deverá ser fechado automaticamente após "2s"
            Exemplos:
                | icone           | mensagem                    | botao |
                | {icone-sucesso} | "Certo, protocolo copiado." | {X}   |

        Esquema do Cenário:CT06 - Valido mensagem de erro ao copiar protocolo
                Dado que o usuário está na tela de "sucesso no cancelamento"
                E clica no botão "Copiar"
                Quando ocorre erro ao copiar o protocolo
                Então deverá ser apresentado o componente dialog contendo <icone>, <mensagem>, <botao>
                E o componente deverá ser fechado automaticamente após "2s"
                Exemplos:
                    | icone           | mensagem                                                               | botao |
                    | {icone-sucesso} | "Poxa, não foi possível copiar o protocolo. Tente de novo mais tarde." | {X}   |