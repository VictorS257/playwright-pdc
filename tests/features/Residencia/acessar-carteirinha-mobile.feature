# language: pt
Funcionalidade: Validar exibição das informações completas da carteirinha do Seguro Residência na versão mobile

    Contexto:Acesso a funcionalidade "Acessar carteirinha"
        Dado que o usuário se autenticou no PDC
        E está utilizando a visualização mobile
        E possui alguma apólice ativa de Seguro Residência
        E acessou o produto "Seguro Residência"
        E selecionou a opção "Acessar carteirinha"

        Cenário:CT01 - Valido loading
            Quando o sistema está recebendo as informações da tela
            Então todos os componentes abaixo do componente breadcrumb deverão estar em estado de carregamento

        Esquema do Cenário:CT02 - Valido funcionamento do header
            Quando o usuário navega entre as telas da aplicação
            Então deve ser sempre exibido o componente header contendo <icone>, <botao>, <divisao>, <botao>
            Exemplos:
                | icone               | botao | botao          |
                | {icone-portoseguro} | {faq} | {menu-usuario} |

        Esquema do Cenário:CT03 - Valido funcionamento do componente breadcrumb
            Quando o usuário navega entre as telas da aplicação
            Então abaixo do header deverá existir o componente breadcrumb contendo <botao>, <mensagem>
            Exemplos:
                | botao    | mensagem |
                | {voltar} | Voltar   |

        Esquema do Cenário:CT04 - Valido exibição dos dados da Frente
            Quando o carregamento da página ocorre com sucesso
            Então abaixo do componente breadcrumb deverá existir o formulário preenchido com o título "Frente" contendo <campo>, <dado>
            Exemplos:
                | campo             | dado                |
                | "título"          | {icone-portoseguro} |
                | "subtitulo"       | {produto-nome}      |
                | Nome social       | {nome-social}       |
                | Nome civil        | {nome-completo}     |
                | Oferta            | {oferta}            |
                | Número da apólice | {apolice-numero}    |
                | Item              | {item}              |
                | Corretor          | {corretor-nome}     |
                | Vencimento        | {data-vencimento}   |
                | Telefone          | {corretor-telefone} |

        Esquema do Cenário:CT05 - Valido exibição dos dados do Verso
            Quando o carregamento da página ocorre com sucesso
            Então abaixo do formulário "Frente" deverá existir o formulário preenchido com o título "Verso" contendo <campo>, <dado>
            E abaixo do formulário deverão existir os botões "Conversar pelo WhatsApp", "Copiar número da apólice"
            Exemplos:
                | campo                                    | dado                                                         |
                | "título"                                 | "{icone-whatsapp}+"WhatAspp todo o Brasil\n{whatsapp-porto}" |
                | "subtitulo"                              | "Central de atendimento 24h"                                 |
                | Capitais                                 | 4004 76786                                                   |
                | Grande São Paulo                         | 3337 6786                                                    |
                | Informações, reclamações e cancelamentos | 0800 727 2766                                                |
                | Exclusivo para PcD auditivo              | 0800 727 8736                                                |
                | Ouvidoria                                | 0800 727 1184                                                |
                | Todo Brasil                              | 0300 337 6786                                                |
                | Atendimento Mercosul                     | +55 11 3366 3189                                             |

        Esquema do Cenário:CT06 - Valido funcionamento do botão "Copiar número da apólice"
            Dado que o carregamento da página ocorreu com sucesso
            Quando o usuário clica no botão "Copiar número da apólice" abaixo dos dados da carteirinha
            Então o número da apólice deverá ser copiado para a área de transferência do dispositivo
            E deverá ser apresentado o componente dialog contendo <icone>, <mensagem>, <botao>
            E o componente deverá ser fechado automaticamente após "2s"
            Exemplos:
                | icone     | mensagem                            | botao |
                | {sucesso} | "Certo, número da apólice copiado." | {X}   |
            
        Cenário:CT07 - Valido funcionamento do botão "x" na mensagem de sucesso ao copiar número da apólice
            Dado que o usuário clicou no botão "Copiar número da apólice"
            E foi apresentada a mensagem de sucesso
            Quando o usuário clica no botão {x} na parte superior direita do componente dialog
            Então a mensagem deverá ser fechada mantendo o usuário na tela da carteirinha

        Esquema do Cenário:CT08 - Valido funcionamento do botão Fale pelo Whatsapp
            Dado que o carregamento da página ocorreu com sucesso
            Quando o usuário clica no componente botão "Fale pelo WhatsApp"
            Então deve ocorrer o direcionamento para o {whatsapp-porto}

        Esquema do Cenário:CT09 - Valido mensagem de erro no carregamento
            Quando ocorre falha ao carregar alguma das informações da página
            Então na área da falha deverão ser apresentadas as informações <icone>, <titulo>, <mensagem>, <botao>
            Exemplos:
                | icone         | titulo                                     | mensagem                      | botao            |
                | {icone-aviso} | "Não foi possível carregar as informações" | "Por favor, tente novamente." | Tentar novamente |

        Esquema do Cenário:CT10 - Valido mensagem de erro ao "Copiar número da apólice"
            Dado que o usuário clicou no botão "Copiar número da apólice"
            Quando ocorre falha ao copiar a mensagem para a área de transferência do dispositivo
            Então deverá ser apresentado o componente dialog contendo <icone>, <mensagem>, <botao>
            Exemplos:
                | icone        | mensagem                                                      | botao |
                | {icone-erro} | "Não foi possível executar a ação. Tente de novo mais tarde." | {X}   |

        Cenário:CT11 - Valido funcionamento do botão "x" na mensagem de erro ao copiar número da apólice
            Dado que o usuário clicou no botão "Copiar número da apólice"
            E foi apresentada a mensagem de sucesso
            Quando o usuário clica no botão {X} na parte superior direita do componente dialog
            Então a mensagem deverá ser fechada mantendo o usuário na tela da carteirinha