# language: pt
Funcionalidade: Validar Página inicial do Seguro Auto-Frota na versão web

    Contexto:Acesso o produto "Seguro Auto-Frota"
        Dado que o usuário se autenticou no PDC
        E está utilizando a visualização web
        E acessou o produto "Seguro Auto-Frota"

        Cenário:CT01 - Valido loading
            Quando o sistema está recebendo as informações da tela
            Então todos os componentes abaixo do componente breadcrumb deverão estar em estado de carregamento

        Esquema do Cenário:CT02 - Valido funcionamento do header
            Quando o usuário navega entre as telas da aplicação
            Então deve ser sempre exibido o componente header contendo <icone>, <botao>, <botao>, <icone-interativo>
            Exemplos:
                | icone               | botao                  | botao                                                       | icone-interativo |
                | {icone-portoseguro} | "Dúvidas "+{icone-faq} | "{icone-menu-usuario}+{nome-usuario}\nCNPJ {segurado-cnpj}" | {>}              |

        Esquema do Cenário:CT03 - Valido funcionamento do componente breadcrumb
            Quando o usuário navega entre as telas da aplicação
            Então abaixo do header deverá existir o componente breadcrumb contendo <botao>, <path>
            Exemplos:
                | botao    | path   |
                | {voltar} | {path} |

        Esquema do Cenário:CT04 - Valido exibição do Menu
            Quando o carregamento da página inicial ocorre com sucesso
            Então na lateral esquerda deverá existir o Menu contendo <botao>, <icone-interativo>
            E abaixo dos botões do menu deverá existir o container com título "Meu corretor"
            E abaixo do container "Meu corretor" deverá existir o componente de lista com o título "Mais produtos" contendo <icone>, <produto>, <icone-interativo>
            Exemplos:
                | botao          | icone-interativo |
                | Página inicial | {>}              |
                | Apóices        | {>}              |
                | Assistência    | {>}              |
                | Sinistro       | {>}              |
            Exemplos:
                | icone           | produto        | icone-interativo |
                | {icone-produto} | {produto-nome} | {>}              |

        Esquema do Cenário:CT05 - Menu Apólices
            Quando o carregamento da página inicial ocorre com sucesso
            E o usuário clica na opção Apolices do menu lateral
            Então deverá expandir a opção contendo <botao>, <icone-interativo>
            Exemplos:
                | botao            | icone-interativo |
                | Dados da Apólice | {>}              |
                | Condições Gerais | {>}              |
        
        Esquema do Cenário:CT06 - Clique Menu Assistências
            Quando o carregamento da página inicial ocorre com sucesso
            E o usuário clica na opção Assistências do menu lateral
            Então deverá expandir a opção contendo <botao>, <icone-interativo>
            Exemplos:
                | botao                     | icone-interativo |
                | Solicitar Assistência     | {>}              |
                | Histórico de Solicitações | {>}              |
                        
        Esquema do Cenário: CT07 - Clique Menu Sinistro
            Quando o carregamento da página inicial ocorre com sucesso
            E o usuário clica na opção Sinistro do menu lateral
            Então deverá expandir a opção contendo <botao>, <icone-interativo>
            Exemplos:
                | botao               | icone-interativo |
                | Abrir Novo Sinistro | {>}              |
                | Meus Sinistros      | {>}              |

        Cenário:CT08 - Valido exibição das informaões do segurado
            Quando o carregamento da página inicial ocorre com sucesso
            Então abaixo do componente breadcrumb deverá ser exibido "{Razão social OU nome social OU nome civil}"

        Regra:Validar funcionamento do scroll de apólices quando o usuário possui mais de uma apólice ativa
            Esquema do Cenário:CT09 - Valido funcionamento do scroll de apólices
                Dado que o usuário possui mais de uma apólice ativa
                Quando o carregamento da página inicial ocorre com sucesso
                Então abaixo do componente breadcrumb deverá existir o componente scroll horizontal de apólices
                E para cada apólice ativa do usuário será criado um item no carrosel contendo <icone>, <info1>, <info2>
                Exemplos:
                    | icone           | info1                    | info2                       |
                    | {icone-produto} | Apólice {apolice-numero} | {produto-nome} - {vigencia} |

        Esquema do Cenário:CT10 - Valido exibição da carteirinha
            Quando o carregamento da página inicial ocorre com sucesso
            Então abaixo das informações do segurado deverá existir o container "frente" contendo <campo>, <info>
            E ao lado direito do container "frente" deverá existir o container "verso" contendo <capo>, <info>
            Exemplos:
                | campo    | info                           |
                | "icone"  | {icone-produto}                |
                | "titulo" | {produto-nome}                 |
                | Apólice  | {apolice-numero}               |
                | Vigência | {data-inicio}+" a "+{data-fim} |
            Exemplos:
                | campo                                      | info                         |
                | "titulo"                                   | "Central de atendimento 24h" |
                | "Grandes capitais"                         | "+55 11 3004-6221"           |
                | "Demais localidades"                       | "0800-727-2810 "             |
                | "Atendimento MERCOSUL"                     | "+55 11 336-3189"            |
                | "Informações, reclamações e cancelamentos" | "0800-727-2766"              |
                | "Ouvidoria"                                | "0800-727-1184"              |
                | Exclusivo para deficientes auditivos       | "0800-727-8736"              |

        Esquema do Cenário:CT11 - Valido exibição das opções de "Ações rápidas"
            Quando o carregamento da página inicial ocorre com sucesso
            Então abaixo co container carteirinha deverá exisir o componente lista horizontal de botões com o título "Ações rápidas"
            E para cada botão do componente deverão ser apresentadas as informações <icone>, <mensagem>, <icone-interativo>
            Exemplos:
                | icone                       | mensagem               | icone-interativo |
                | {icone-baixar-apolice}      | Baixar Apólice         | {>}              |
                | {icone-ver-apólice}         | Ver Apólice            | {>}              |
                | {icone-novo-aviso-sinistro} | Novo Aviso de Sinistro | {>}              |

        Esquema do Cenário:CT12 - Valido exibição das opções de Atalhos
            Quando o carregamento da página inicial ocorre com sucesso
            Então abaixo do container "Ações rápidas" deverá existir o componente lista horizontal de botões com o título "Atalhos"
            E para cada botão do componente deverão ser apresentadas as informações <icone>, <mensagem>
            Exemplos:
                | icone                          | mensagem                  |
                | {icone-solicitar-assistencia}  | Solicitar Assistência     |
                | {icone-meus-sinistros}         | Meus Sinistros            |
                | {icone-dados-apolice}          | Dados da Apólice          |
                | {icone-condições-gerais}       | Condições Gerais          |

        Esquema do Cenário:CT013 - Valido funcionamento do scroll Mais Porto para você
            Quando o carregamento da página inicial ocorre com sucesso
            Então abaixo das opções de Atalhos deverá existir o componente scroll horizontal com o título "Mais Porto para você"
            E para cada item do carrosel deverão ser apresentadas as informações <titulo>, <mensagem>, <subtitulo>, <banner>
            Exemplos:
                | titulo     | mensagem         | subtitulo   | banner         |
                | {h1-promo} | {mensagem-promo} | {sub-promo} | {banner-promo} |

        Cenário:CT14 - Valido funcionamento do botão "WhatsApp"
            Quando o carregamento da página inicial ocorre com sucesso
            E o usuário clica no botão "WhatsApp" na parte inferior direita da tela
            Então deverá ocorrer o direcionamento para o {whatsapp-porto}

        Esquema do Cenário:CT15 - Valido mensagem de erro
            Quando ocorre falha ao carregar alguma das informações da página
            Então na área da falha deverá ser apresentado o componente dialog contendo <icone>, <titulo>, <mensagem>, <botao>
            Exemplos:
                | icone         | titulo                                     | mensagem                     | botao            |
                | {icone-aviso} | "Não foi possível carregar as informações" | "Por favor tente novamente." | Tentar novamente |