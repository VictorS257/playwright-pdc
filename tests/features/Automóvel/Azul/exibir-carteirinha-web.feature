# language: pt
Funcionalidade: Validar exibição das informações completas da carteirinha do Seguro Auto-Azul na versão web

    Contexto:Acesso a funcionalidade "Exibir carteirinha"
        Dado que o usuário se autenticou no PDC
        E está utilizando a visualização web
        E possui alguma apólice ativa de Seguro Auto-Azul
        E acessou o produto "Seguro Auto-Azul"
        E selecionou a opção "Exibir carteirinha"

        Cenário:CT01 - Valido tela de carregamento
            Quando o sistema está recebendo as informações da tela
            Então todos os componentes abaixo do componente breadcrumb deverão estar em estado de carregamento

        Esquema do Cenário:CT02 - Valido funcionamento do header
            Quando o usuário navega entre as telas da aplicação
            Então deve ser sempre exibido o componente header contendo <icone>, <botao>, <botao>, <icone-interativo>
            Exemplos:
                | icone               | botao                  | botao                               | icone-interativo |
                | {icone-portoseguro} | "Dúvidas "+{icone-faq} | {icone-menu-usuario}+{nome-usuario} | {>}              |

        Esquema do Cenário:CT03 - Valido funcionamento do componente breadcrumb
            Quando o usuário navega entre as telas da aplicação
            Então abaixo do header deverá existir o componente breadcrumb contendo <botao>, <path>
            Exemplos:
                | botao    | path   |
                | {voltar} | {path} |

        Esquema do Cenário:CT04 - Valido exibição dos dados da Frente
            Quando o carregamento da página ocorre com sucesso
            Então abaixo do componente breadcrumb deverá existir o formulário preenchido contendo <campo> <dado>
            E abaixo do formulário deverá existir o botão "Copiar número da apólice"   
            Exemplos:
                | campo             | dado                |
                | "título"          | {icone-produto}     |
                | "subtitulo"       | {produto-nome}      |
                | Nome social       | {nome-social}       |
                | Nome civil        | {nome-completo}     |
                | Veículo           | {Marca} {Modelo}    |
                | Número da apólice | {apolice-numero}    |
                | Item              | {item}              |
                | Vencimento        | {data-vencimento}   |
                | Placa             | {veículo-placa}     |
                | Corretor          | {corretor-nome}     |
                | Telefone          | {corretor-telefone} |

        Esquema do Cenário:CT05 - Valido exibição dos dados do Verso
            Quando o carregamento da página ocorre com sucesso
            Então alinhado à direita do formulário "Frente" deverá existir o formulário preenchido contendo <campo> <dado>
            E abaixo do formulário deverá existir o botão "Fale pelo whatsapp"
            Exemplos:
                | campo                                    | dado                                                         |
                | "título"                                 | "Central de atendimento 24h"                                 |
                | "subtitulo"                              | "{icone-whatsapp}+"Whatsapp todo o Brasil\n{whatsapp-porto}" |
                | Capitais                                 | 4004 76786                                                   |
                | Grande São Paulo                         | 3337 6786                                                    |
                | Informações, reclamações e cancelamentos | 0800 727 2766                                                |
                | Exclusivo para PcD auditivo              | 0800 727 8736                                                |
                | Ouvidoria                                | 0800 727 1184                                                |
                | Todo Brasil                              | 0300 337 6786                                                |
                | Atendiento Mercosul                      | +55 11 3366 3189                                             |

        Esquema do Cenário:CT06 - Valido funcionamento do botão "Copiar número da apólice"
            Dado que o carregamento da página ocorreu com sucesso
            Quando o usuário clica no botão "Copiar número da apólice" abaixo do formulário "Frente"
            Então o número da apólice deverá ser copiado para a área de transferência do dispositivo
            E deverá ser apresentado o componente dialog contendo <icone>, <mensagem>, <botao>
            E o componente deverá ser fechado automaticamente após "2s"
            Exemplos:
                | icone           | mensagem                                | botao |
                | {icone-sucesso} | "Certo, código da apólice copiado."     | {X}   |

        Cenário:CT07 - Valido funcionamento do botão "x" na mensagem de sucesso ao copiar número da apólice
            Dado que o usuário clicou no botão "Copiar número da apólice"
            E foi apresentada a mensagem de sucesso
            Quando o usuário clica no botão {x} na parte superior direita do componente dialog
            Então a mensagem deverá ser fechada mantendo o usuário na tela da carteirinha

        Esquema do Cenário:CT08 - Valido funcionamento do botão Fale pelo WhatsApp
            Dado que o carregamento da página ocorreu com sucesso
            Quando o usuário clica no componente botão <mensagem>, <icone> abaixo do furmulário "Verso" 
            Então deve ocorrer o direcionamento para o {whatsapp-porto}
            Exemplos:
                | mensagem             | icone      |
                | "Fale pelo whatsApp" | {whatsapp} |

        Esquema do Cenário:CT09 - Valido mensagem de erro no carregamento
            Quando ocorre falha ao carregar alguma das informações da página
            Então na área da falha deverá ser ser apresentado o componente dialog contendo <icone>, <titulo>, <mensagem>, <botao>
            Exemplos:
                | icone        | titulo                                     | mensagem                     | botao            |
                | {ione-aviso} | "Não foi possível carregar as informações" | "Por favor tente novamente." | Tentar novamente |

        Esquema do Cenário:CT10 - Valido mensagem de erro ao "Copiar número da apólice"
            Dado que o usuário clicou no botão "Copiar número da apólice"
            Quando ocorre falha ao copiar a mensagem para a área de transferência do dispositivo
            Então deverá ser apresentado o componente dialog contendo <icone>, <mensagem>, <botao>
            Exemplos:
                | icone        | mensagem                                                             | botao |
                | {icone-erro} | "Poxa, não foi possível executar a ação. Por favor tente novamente." | {X}   |

        Cenário:CT11 - Valido funcionamento do botão "x" na mensagem de erro ao copiar número da apólice
            Dado que o usuário clicou no botão "Copiar número da apólice"
            E foi apresentada a mensagem de sucesso
            Quando o usuário clica no botão {X} na parte superior direita do componente dialog
            Então a mensagem deverá ser fechada mantendo o usuário na tela da carteirinha