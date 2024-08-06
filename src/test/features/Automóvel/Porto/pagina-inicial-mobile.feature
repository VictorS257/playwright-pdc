# language: pt
Funcionalidade: Validar Página inicial do Seguro Automóvel na versão mobile

    Contexto:Acesso o produto "Seguro Automóvel"
        Dado que o usuário se autenticou no PDC
        E está utilizando a visualização mobile
        E acessou o produto "Seguro Automóvel"

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

        Cenário:CT04 - Valido exibição das informaões da apólice
            Quando o carregamento da página inicial ocorre com sucesso
            Então abaixo do componente breadcrumb deverá ser exibido "{Marca} {Modelo}" da apólice
            E abaixo das informações resumidas da apólice deverá existir a informação {placa-final}

        Regra:Validar funcionamento do scroll de apólices quando o usuário possui mais de uma apólice ativa
            Esquema do Cenário:CT05 - Valido funcionamento do scroll de apólices
                Dado que o usuário possui mais de uma apólice ativa
                Quando o carregamento da página inicial ocorre com sucesso
                Então abaixo do componente breadcrumb deverá existir o componente scroll horizontal de apólices
                E para cada apólice ativa do usuário será criado um item no carrosel contendo <icone>, <info>
                Exemplos:
                    | icone           | info                            |
                    | {icone-produto} | {Marca} {Modelo}\n{placa-final} |
            
            Cenário:CT06 - Valido tela de carregamento entre apólices
                Dado que foi exibido o scroll horizontal de apólices
                E o usuário seleciona uma apólice diferente da atual no componente
                Quando o sistema está recebendo as informações da apólice selecionada
                Então todas as informações de apólice devem estar em estado de carregamento

            Cenário:CT07 - Valido alteração de apólice
                Dado que foi exibido o scroll horizontal de apólices
                E o usuário seleciona uma apólice diferente da atual no componente
                Quando o sistema recebe as informações da apólice selecionada
                Então abaixo do componente scroll horizontal de Apólices deverá ser exibido "{Marca} {Modelo}" da apólice selecionada
                E abaixo das informações resumidas da apólice deverá existir a informação {placa-final}

        Esquema do Cenário:CT08 - Valido exibição das informações resumidas da carteirinha
            Quando o carregamento da página inicial ocorre com sucesso
            Então abaixo das informações da apólice deverá ser exibido o resumo da certeirinha com o título "{icone-produto}"
            E ao lado direito do título deverá existir o link "Exibir carteirinha"
            E abaixo do título deverá existir o formulário preenchido com o título "{produto-nome}" contendo <campo>, <dado>
            Exemplos:
                | campo    | dado                           |
                | Apólice  | {apolice-numero}               |
                | Vigência | {data-inicio}+" a "+{data-fim} |

        Esquema do Cenário:CT09 - Valido funcionamento do scroll Ações rápidas
            Quando o carregamento da página inicial ocorre com sucesso
            Então abaixo das informações resumidas da carteirinha deverá exisir o componente scroll horizontal com o título "Ações rápidas"
            E para cada item do carrosel deverão ser apresentadas as informações <icone>, <mensagem>, <icone-interativo>
            Exemplos:
                | icone                       | mensagem               | icone-interativo |
                | {icone-baixar-apolice}      | Baixar apólice         | {>}              |
                | {icone-ver-apólice}         | Ver apólice            | {>}              |
                | {icone-nova-assistencia}    | Nova assistência       | {>}              |
                | {icone-novo-aviso-sinistro} | Novo aviso de sinistro | {>}              |

        Esquema do Cenário:CT10 - Valido exibição dos dados da parcela atual
            Quando o carregamento da página inicial ocorre com sucesso
            Então abaixo do componente scroll Ações rápidas deverá existir o formulário preenchido com o título "Parcela {parcela-numero} de {total-parcelas}" contendo <valor>, <vencimento>, <botao>
            Mas caso {parcela-numero} seja igual a {total-parcelas} o título do componente deverá ser "Sem parcelas futuras"
            Exemplos:
                | valor                 | vencimento                       | botao        |
                | "R$ "+{parcela-valor} | "Vence em "+{parcela-vencimento} | Ver Parcelas |     

        Esquema do Cenário:CT11 - Valido funcionamento do scroll Atalhos
            Quando o carregamento da página inicial ocorre com sucesso
            Então abaixo dos dados da parcela atual deverá existir o componente scroll horizontal com o título "Atalhos"
            E para cada item do carrosel deverão ser apresentadas as informações <icone>, <mensagem>
            Exemplos:
                | icone                          | mensagem                  |
                | {icone-solicitar-assistencia}  | Solicitar assistência     |
                | {icone-meus-sinistros}         | Meus sinistros            |
                | {icone-coberturas-contratadas} | Coberturas contratadas    |
                | {icone-residencia}             | Assistências residenciais |
                | {icone-dados-apolice}          | Dados da apólice          |
                | {icone-condições-gerais}       | Condições gerais          |
                | {icone-juridico}               | Apoio jurídico            |
                | {icone-centros-automotivos}    | Centros automotivos       |

        Esquema do Cenário:CT12 - Valido funcionamento do scroll Mais Porto para você
            Quando o carregamento da página inicial ocorre com sucesso
            Então abaixo do scroll Atalhos deverá existir o componente scroll horizontal com o título "Mais Porto para você"
            E para cada item do carrosel deverão ser apresentadas as informações <titulo>, <mensagem>, <subtitulo>, <banner>
            Exemplos:
                | titulo     | mensagem         | subtitulo   | banner         |
                | {h1-promo} | {mensagem-promo} | {sub-promo} | {banner-promo} |

        Esquema do Cenário:CT13 - Valido funcionamento do Menu
            Quando clico no botão flutuante "Menu"
            Então deverá ser exibido o drawer o título "Menu" contendo <botao>, <icone-interativo>
            E na parte superior direita do componente deverá existir o botão {x} que irá fechar o drawer
            E abaixo dos botões do menu deverá existir o container com título "Meu corretor"
            E abaixo do container "Meu corretor" deverá existir o componente de lista com o título "Mais produtos" contendo <icone>, <produto>, <icone-interativo>
            Exemplos:
                | botao          | icone-interativo |
                | Página inicial | {>}              |
                | Parcelas       | {>}              |
                | Apóices        | {>}              |
                | Assistência    | {>}              |
                | Sinistro       | {>}              |
            Exemplos:
                | icone           | produto        | icone-interativo |
                | {icone-produto} | {produto-nome} | {>}              |

        Esquema do Cenário:CT14 - Menu Apólices
            Quando o carregamento da página inicial ocorre com sucesso
            E o usuário clica na opção Apólices do drawer Menu
            Então deverá expandir a opção contendo <botao>, <icone-interativo>
            Exemplos:
                | botao                  | icone-interativo |
                | Dados da apólice       | {>}              |
                | Coberturas contratadas | {>}              |
                | Condições gerais       | {>}              |
        
        Esquema do Cenário:CT15 - Menu Assistências
            Quando o carregamento da página inicial ocorre com sucesso
            E o usuário clica na opção Assistências do drawer Menu
            Então deverá expandir a opção contendo <botao>, <icone-interativo>
            Exemplos:
                | botao                     | icone-interativo |
                | Solicitar assistência     | {>}              |
                | Assistências residenciais | {>}              |
                | Histórico de solicitações | {>}              |
                | Apoio jurídico            | {>}              |
                | Centros automotivos       | {>}              |
                        
        Esquema do Cenário: CT16 - Menu Sinistro
            Quando o carregamento da página inicial ocorre com sucesso
            E o usuário clica na opção Sinistro do drawer Menu
            Então deverá expandir a opção contendo <botao>, <icone-interativo>
            Exemplos:
                | botao               | icone-interativo |
                | Abrir Novo Sinistro | {>}              |
                | Meus Sinistros      | {>}              |
                | Enviar Documentos   | {>}              |

        Cenário:CT17 - Valido funcionamento do botão "WhatsApp"
            Quando o carregamento da página inicial ocorre com sucesso
            E o usuário clica no botão "WhatsApp" na parte inferior direita da tela
            Então deverá ocorrer o direcionamento para o {whatsapp-porto}

        Esquema do Cenário:CT18 - Valido funcionamento da notificação de Acompanhamento de sinistro
            Dado que o usuário possui sinistro Automóvel com status "Em acompanhamento" vinculado à apólice
            Quando o carregamento da página inicial ocorre com sucesso
            Então abaixo do componente breadcrumb deverá existir o componente dialog contendo <titulo>, <mensagem>, <link>
            E na parte superior direita do componente deverá existir o botão {x} que irá fechar o dialog
            Exemplos:
                | titulo                   | mensagem                                           |  link           |
                | "Acompanhe seu sinistro" | "Encontre aqui o(s) sinistro(s) que você acionou." |  Meus Sinistros |

        Esquema do Cenário:CT19 - Valido funcionamento da notificação de "Endosso"
            Dado que o usuário possui "Endosso" vinculado à apólice
            E o carregamento da página inicial ocorre com sucesso
            Então abaixo das "informações da parcela atual" deverá existir o componente dialog contendo <titulo>, <mensagem>, <link>
            E na parte superior direita do componente deverá existir o botão {x} que irá fechar o dialog
            Exemplos:
                | titulo                    | mensagem                                                     | link                |
                | {icone-endosso}+"Endosso" | "Existem pagamentos adicionais por alterações no seu seguro" | Ir para atendimento |

        Esquema do Cenário:CT20 - Valido mensagem de erro
            Quando ocorre falha ao carregar alguma das informações da página
            Então na área da falha deverá ser apresentado o componente dialog contendo <icone>, <titulo>, <mensagem>, <botao>
            Exemplos:
                | icone         | titulo                                     | mensagem                     | botao            |
                | {icone-aviso} | "Não foi possível carregar as informações" | "Por favor tente novamente." | Tentar novamente |