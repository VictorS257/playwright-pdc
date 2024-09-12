# language: pt
Funcionalidade:Validar funcionamento da tela Meus sinistros do Seguro Auto-Azul na versão mobile

    Contexto: Acesso a tela Meus sinistros
        Dado que o usuário se autenticou no PDC
        E o usuário está utilizando a visualização mobile
        E o usuário clicou na opção "Meus sinistros" no scroll Atalhos

        Cenário:CT01 - Valido loading
            Quando o sistema está recebendo as informações da tela
            Então todos os componentes abaixo do componente breadcrumb deverão estar em estado de carregamento

        Esquema do Cenário:CT02 - Valido funcionamento do header
            Quando o usuário navega entre as telas da aplicação
            Então deve ser sempre exibido o componente header contendo <icone>, <botao>, <botao>
            Exemplos:
                | icone               | botao | botao          |
                | {icone-portoseguro} | {faq} | {menu-usuario} |

        Esquema do Cenário:CT03 - Valido funcionamento do componente breadcrumb
            Quando o usuário navega entre as telas da aplicação
            Então abaixo do header deverá existir o componente breadcrumb contendo <botao>, <mensagem>
            Exemplos:
                | botao    | mensagem |
                | {voltar} | Voltar   |

       Esquema do Cenário:CT04 - Valido exibição dos dados da apólice
            Quando o sistema recebe as informações da tela
            Então abaixo do componente breadcrumb deverá existir o container de informações da apólice contendo <icone>, <titulo>, <mensagem>, <botao>
            Exemplos:
                | icone           | titulo                         | mensagem       | botao           |
                | {icone-produto} | {Marca} {Modelo}-{placa-final} | {produto-nome} | Alterar apólice |

        Esquema do Cenário:CT05 - Valido container Minha franquia
            Quando o sistema recebe as informações da tela
            Então abaixo da lista de sinistros concluídos deverá existir o container contendo <titulo>, <valor>, <mensagem>, <link>
            Exemplos:
                | titulo           | valor                  | mensagem             | link             |
                | "Minha franquia" | "R$ "+{franquia-valor} | {franquia-cobertura} | Outras franquias |

        Esquema do Cenário:CT06 - Valido exibição do dialog "Quando abrir um sinistro?"
            Quando o sistema recebe as informações da tela
            Então abaixo do container "Minha franquia" deverá existir o componente dialog contendo <titulo>, <mensagem>, <botao>
            Exemplos:
                | titulo                      | mensagem                                                                                                                                                                  | botao      |
                | "Quando abrir um sinistro?" | "Em caso de colisão, roubo, furto, incêndio, entre outras situações que estejam cobertas pelo seguro. Desse modo, você acionará os reparos necessários ou a indenização." | Saiba mais |

        Cenário:CT07 - Valido botão "Abrir um novo sinistro"
            Dado que o sistema recebeu as informações da tela
            E foi exibido o botão "Abrir um novo sinistro" no rodapé da página
            Quando o usuário clica no botão "Abrir um novo sinistro" 
            Então o usuário deverá ser direcionado para o "SalesForce"

        Regra: Apólice sem sinistros em aberto
            Esquema do Cenário:CT08 - Valido container Acompanhamento sem sinistros
                Quando o usuário não possui nenhum sinistro em aberto vinculado à apólice selecionada
                Então o container "Acompanhamento" deverá conter <icone>, <mensagem>
                Exemplos:
                    | icone             | mensagem                        |
                    | {icone-documento} | "Você não tem sinistro aberto." |

        Regra: Apólice com sinistros em aberto
            Esquema do Cenário:CT09 - Valido container Acompanhamento com sinistro
                Quando o usuário possui algum sinistro em aberto vinculado à apólice selecionada
                Então para cada sinistro em aberto vinculado à apólice será criado um item no container "Acompanhamento" contendo <icone>, <titulo>, <info>
                E para cada evento nos sinistros deverá ser criado um item no checklist contendo <icone>, <titulo>, <data>, <info>, <icone-interativo>
                E abaixo do checklist deverá existir o botão "Ver detalhes"
                Exemplos:
                    | icone            | titulo           | info                           |
                    | {icone-sinistro} | {cobertura-nome} | "Sinistro: "+{sinistro-numero} |
                Exemplos:
                    | icone          | titulo        | data                                | info               | icone-interativo |
                    | {icone-status} | {evento-nome} | {evento-data}+ " às " {evento-hora} | {evento-descricao} |   {>}            |

            Cenário:CT10 - Valido erro ao carregar as informações dos sinistros do SalesForce
                Dado o usuário possui algum sinistro em aberto vinculado à apólice selecionada
                Quando ocorre falha ao carregar as informações do sinitro do SalesForce
                Então o botão "Ver detalhes" deverá ser substituído pelo botão "Entre em contato"

            Esquema do Cenário:CT11 - Valido modal "Telefones Porto Seguro"
                Dado que foi exibido o botão "Entre em contato"
                Quando o usuário clica no botão "Entre em contato"
                Então deverá ser exibido o modal com o título "Telefones Porto Seguro" e subtítulo "Para mais informações, basta ligar para a central de atendimento da Porto."
                E abaixo do subtítulo deverá existir o formulário preenchido contendo <campo>, <dado>
                E abaixo do formulário deverá existir o botão "Voltar"
                E na parte superior direita do componente deverá existir o botão {x} que irá fechar o modal
                E na parte superior esquerda do componente deverá existir o botão {voltar} que irá retornar à listagem de sinistros
                Exemplos:
                    | campo                                    | dado                                                      |
                    | Central de Serviços - Grande SP          | 3337 6786                                                 |
                    | Central de Serviços - Demais localidades | 0300 337 6786                                             |
                    | SAC - Atendimento 24h                    | 0800 727 2766                                             |
                    | SAC - Exclusivo para PCD auditivo        | 0800 727 2766\n"De segunda a sexta-feira, das 06h às 22h" |
                    | Atendimento Mercosul                     | +55 11 3366 3189                                          |

        Esquema do Cenário:CT12 - Valido lista de sinistros concluídos
            Quando o usuário possui sinistro concluído vinculado à apólice selecionada
            Então abaixo do container "Acompanhamento" deverá existir a lista de sinistros com título "Sinistros"
            E para cada sinistro vinculado à apólice selecionada deverá ser criado um item minimizado na lista contendo <icone>, <titulo>, <status>, <info>, <icone-interativo>
            Exemplos:
                | icone            | titulo           | status            | info                           | icone-interativo |
                | {icone-sinistro} | {cobertura-nome} | {sinistro-status} | "Sinistro: "+{sinistro-numero} | {>}              |

        Esquema do Cenário:CT13 - Valido modal "Detalhes do sinistro"
            Dado que foi exibida a lista de sinistros em da apólice
            Quando o usuário clica no botão "Ver detalhes" em algum item da lista de sinistros
            Então o usuário deverá ser direcionado para o "SalesForce"

        Esquema do Cenário:CT14 - Valido modal "Quando abrir um sinistro?"
            Dado que o sistema recebeu as informações da tela
            Quando o usuário clica no botão "Saiba mais" no dialog "Quando abrir um sinistro?"
            Então deverá ser exibido o modal com título "Quando abrir um sinistro?" contendo <img>, <msg>
            E abaixo da mensagem deverá existir o componente lista de itens com o título "Aqui estão algumas situações em que você pode precisar acionar o seguro:"
            E para cada cobertura vinculada à apólice será criado um item na lista contendo <icone>, <titulo>, <mensagem>
            E na parte superior esquerda do componente deverá existir o botão {voltar} que irá retornar à lista de apólices
            E na parte superior direita do componente deverá existir o botão {x} que irá fechar o modal
            E na lateral inferior direita do modal deverá existir o botão flutuante "Abrir um novo sinistro"
            Exemplos:
                | img                         | msg                                                                                                                                                                                                                                                                  |
                | {img-apresentacao-sinistro} | "A abertura de sinistro é o procedimento necessário para registrar danos, perdas, ou acidentes relacionados à sua apólice. Para assistências como chaveiro, eletricista, encanador, dentre outros, volte para o menu Automóvel e clique em "solicitar assistência"." |
            Exemplos:
                | icone             | titulo           | mensagem              |
                | {icone-cobertura} | {cobertura-nome} | {cobertura-descricao} |
                
        Esquema do Cenário:CT15 - Valido mensagem de erro 
            Quando ocorre falha ao carregar alguma das informações da página
            Então na área da falha deverá ser apresentado o componente dialog contendo <icone>, <titulo>, <mensagem>, <botao>
            Exemplos:
                | icone         | titulo                                     | mensagem                     | botao            |
                | {icone-aviso} | "Não foi possível carregar as informações" | "Por favor tente novamente." | Tentar novamente |