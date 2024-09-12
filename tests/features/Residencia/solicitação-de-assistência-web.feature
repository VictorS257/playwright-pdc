# language: pt
Funcionalidade: Validar funcionamento da tela Solicitar assistência do Seguro Residência na versão web

    Contexto: Acesos a tela Solicitar assistência
        Dado que o usuário se autenticou no PDC
        E está utilizando a visualização web
        E possui assistências disponíveis para a apólice
        E acessou o produto "Seguro Residência"
        E clicou no botão "Solicitar assistência" na tela de Informações de assistências

        Cenário:CT01 - Valido loading do tipo de assistência
            Quando o sistema está recebendo as informações dos tipos de assistência
            Então todos os componentes abaixo do componente breadcrumb deverão estar em estado de carregamento

        Cenário:CT02 - Valido loading do item assistência
            Dado que o usuário selecionou o tipo de assistência
            E clicou em "Continuar"
            Quando o sistema está recebendo as informações da tela
            Então todos os componentes da tela de itens de assistência deverão estar em estado de carregamento

        Cenário:CT03 - Valido loading do agendamento
            Dado que o usuário selecionou o item de assistência
            E clicou em "Continuar"
            Quando o sistema está recebendo as informações da tela
            Então todos os componentes da tela de agendamento deverão estar em estado de carregamento

        Esquema do Cenário:CT04 - Valido funcionamento do header
            Quando o usuário navega entre as telas da aplicação
            Então deve ser sempre exibido o componente header contendo <icone>, <botao1>, <botao2>, <icone-interativo>
            Exemplos:
                | icone               | botao1                  | botao2                               | icone-interativo |
                | {icone-portoseguro} | "Dúvidas "+{icone-faq}  | {icone-menu-usuario}+{nome-usuario}  | {>}              |

        Esquema do Cenário:CT05 - Valido funcionamento do componente breadcrumb
            Quando o usuário navega entre as telas da aplicação
            Então abaixo do header deverá existir o componente breadcrumb contendo <botao>, <path>
            Exemplos:
                | botao    | path   |
                | {voltar} | {path} |

        Esquema do Cenário:CT06 - Valido exibição dos dados da apólice
            Quando o sistema recebe as informações da tela
            Então abaixo do componente breadcrumb deverá existir o container de informações da apólice contendo <icone>, <titulo>, <mensagem>, <botao>
            Mas caso o usuário possua apenas uma apólice o botão "Alterar apólice" não deverá existir no container dados da apólice
            Exemplos:
                | icone           | titulo          | mensagem       | botao           |
                | {icone-produto} | {Rua}, {Numero} | {produto-ramo} | Alterar apólice |

        Cenário:CT07 - Valido componente checklist
            Quando o sistema recebe as informações da tela
            Então na lateral superior direita deverá existir um checklist indicando a etapa atual do processo de solicitação de assistência
            E as etapas serão "Assistência", "Agendamento", "Confirmação"
            E a etapa "Assistência" deverá possuir os subitens "Tipo de assistência", "Item de assistência"
            E a etapa "Agendamento" deverá possuir o subitem "Data e horário"
            E os subitens "Tipo de assistência", "Item de assistência" devem possuir o nome do item selecionado abaixo do subitem
            E o subitem "Data e horário" deverá ser substituído pela data selecionada na etapa "Agendamento"
            E para cada etapa concluída deverá ser habilitado o botão "Editar"

        Esquema do Cenário:CT08 - Valido exibição dos tipos de assistência
            Quando o sistema recebe as informações da tela
            Então abaixo das informações da apólice deverá existir a lista de itens com título "Que tipo de assistência você está procurando?" contendo <icone>, <tipo>
            Exemplos:
                | icone               | tipo               |
                | {icone-assistencia} | {assistencia-nome} |

        Esquema do Cenário:CT09 - Valido informações do tipo de assistência
            Quando o usuário seleciona um tipo de assistência
            Então abaixo do componente breadcrumb deverá existir o título "Confira algumas informações antes de solicitar a assistência"
            E abaixo do título deverá existir o container com o título "{icone-tipo-assistencia} {tipo-assistencia}"
            E para cada tópico do tipo de assistência deverá ser criado um container contendo <icone>, <titulo>, <icone-interativo>
            E abaixo do container deverão existir os botões "Voltar", "Continuar"
            Exemplos:
                | icone         | titulo          | icone-interativo |
                | {icone-aviso} | {topico-titulo} | {>}              |

        Cenário:CT10 - Valido detalhes dos tópicos
            Dado que o usuário selecionou um tipo de assistência
            Quando clica em algum dos tópicos no container de informações do tipo de assistência
            Então o tópico deverá ser expandido exibindo {topico-mensagem} abaixo do título

        Cenário:CT11 - Valido exibição dos itens de assistência
            Dado que o usuário selecionou um tipo de assistência
            E clicou no botão "Continuar"
            Quando o sistema recebe as informações de ites de assistência
            Então abaixo do componente breadcrumb deverá existir o título "Selecione os itens para assistência" e o subtítulo "Você pode selecionar até 3 itens por solicitação."
            E para cada item de assistência vinculado ao tipo de assistência deverá ser criado um item abaixo do subtítulo
            E abaixo dos itens de assistência deverão existir os botões "Voltar", "Continuar"
        
        Esquema do Cenário:CT12 - Valido mensagem de erro ao não selecionar um item de assistência
            Dado que o usuário está na tela de itens de assistência
            E não selecionou nenhum item
            Quando o usuário clica no botão "Continuar"
            Então deverá ser exibido o componente dialog contendo <icone>, <mensagem>, <botao>
            Exemplos:
                | icone        | mensagem                                                  | botao |
                | {icone-erro} | "Selecione de 1 a 3 itens de assistência para continuar." | {x}   |

        Cenário:CT13 - Valido tela de agendamento
            Dado que o usuário selecionou ao menos um item de assistência
            E clicou no botão "Continuar"
            Quando o sistema recebe as informações da tela
            Então abaixo do componente breadcrumb deverá existir o título "Agendamento de assistência" e o subtítulo "Escolha a melhor data para o atendimento."
            E abaixo do subtítulo deverá existir o {mes} com datas disponíveis para agendamento
            E abaixo do mês deverão ser listados na horizontal as "5" datas mais próximas com horários disponíveis para agendamento
            E à direita das datas deverá existir o botão "Outras datas"
            E abaixo da lista de datas deverão existir as guias "Manhã", "Tarde", "Noite"
            E para cada faixa de horário disponível para agendamento deverá ser criado um item do tipo RadioButton na sua respectiva guia
            E abaixo das faixas de horário deverão existir os botões "Voltar", "Continuar"

        Esquema do Cenário:CT14 - Valido período sem horários disponíveis
            Dado que o usuário selecionou uma data sem horários disponíveis em alguma das guias de período
            Quando o usuário está na guia de período sem horários disponíveis
            Então abaixo das guias de período deverá existir o componente dialog contendo <icone>, <mensagem>
            Exemplos:
                | icone              | mensagem                                                   |
                | {icone-cronometro} | "Poxa, não há horário disponível no período da {periodo}." |

        Esquema do Cenário:CT15 - Valido item sem datas disponíveis
            Dado que o usuário selecionou um item de asistência sem datas disponíveis
            Então abaixo do subtítulo da página deverá existir o componente dialog contendo <icone>, <mensagem>
            E o botão "Continuar" deverá ser removido
            Exemplos:
                | icone              | mensagem                                        |
                | {icone-calendario} | "Poxa, não há data disponível para selecionar." |

        Esquema do Cenário:CT16 - Valido erro ao não selecionar horário
            Dado que o usuário selecionou um item de asistência
            Quando clica no botão "Continuar" sem selecionar uma faixa de horário
            Então deverá ser apresentado o componente dialog contendo <icone>, <mensagem>, <botao>
            Exemplos:
                | icone        | mensagem                               |     |
                | {icone-erro} | "Selecione um horario para continuar." | {x} |

        Cenário:CT17 - Valido botão "Outras datas"
            Dado que foram listadas as datas disponíveis para o item de assistência selecionado
            Quando o usuário clica no botão "Outras datas"
            Então deverá ser exibido o calendário com a data atual selecionada
            E as datas ateriores deverão estar desabilitadas para seleção
            E o calendário deverá conter os botões "Fechar", "Selecionar"

        Esquema do Cenário:CT18 - Valido container "Assistência imediata"
            Quando o sistema recebe as informações da tela
            Então abaixo do checklist deverá existir o container contendo <titulo>, <mensagem>, <botao>
            Exemplos:
                | titulo                 | mensagem                               | botao     |
                | "Assistência imediata" | "Preciso de atendimento, agora mesmo." | Solicitar |

        Esquema do Cenário:CT19 - Valido dialog Horário indisponível
            Dado que o usuário selecionou uma faixa de horário para o agendamento
            E clicou no botão "Continuar"
            Quando a faixa de horário estiver indisponível
            Então deverá ser exibido o componente dialog contendo <icone>, <titulo>, <mensagem>, <botao>
            Exemplos:
                | icone         | titulo                      | mensagem                                          | botao    |
                | {icone-aviso} | "Selecione um novo horário" | "Infelizmente, esse já não está mais disponível." | Escolher |

        Esquema do Cenário:CT20 - Valido dialog Serviço indisponível
            Dado que o usuário clicou no botão "Solicitar" do container Assitência imediata
            Quando o serviço Assistência imediata está indisponível
            Então deverá ser exibido o componente dialog contendo <icone>, <titulo>, <mensagem>, <botao>
            Exemplos:
                | icone         | titulo                 | mensagem                                                                                       | botao   |
                | {icone-aviso} | "Serviço indisponível" | "O atendimento imediato não está disponível, no momento. Por favor, tente de novo mais tarde." | Entendi |

        Esquema do Cenário:CT21 - Valido dialog Atendimento indisponível
            Dado que o usuário clicou no botão "Solicitar" do container Assitência imediata
            Quando não houverem horários disponíveis para o serviço
            Então deverá ser exibido o componente dialog contendo <icone>, <titulo>, <mensagem>, <botao>
            Exemplos:
                | icone         | titulo                     | mensagem                                                                 | botao   |
                | {icone-aviso} | "Atendimento indisponível" | "Infelizmente, não temos mais horário disponível para auxilio imediato." | Entendi |

        Esquema do Cenário:CT22 - Valido tela de Confirmação da solicitação
            Dado que o usuário selecionou um horário para o agendamento
            E clicou no botão "Continuar"
            Quando o sistema recebe as informações da tela
            Então abaixo do componente breadcrumb deverá existir a lista de itens com o título "Confirmação da solicitação" e subtítulo "Confira as informações antes de confirmar." contedo <titulo>, <botao>, <icone>, <info1>, <info2>
            E abaixo dos itens deverão existir os botões "Voltar", "Confirmar e solicitar assistência"
            Exemplos:
                | titulo              | botao   | icone                    | info1              | info2                       |
                | Tipo de assistência | Alterar | {icone-tipo-assistencia} | {assistencia-tipo} | {assistencia-item}          |
                | Endereço            | Alterar | {icone-endereco}         | {Rua}, {Numero}    | {Cidade}-{UF} {complemento} |
                | Agendamento         | Alterar | {icone-calendario}       | {agendamento-data} | {agendamento-hora}          |
                | Contato             | Alterar | {icone-telefone}         | {cliente-nome}     | {cliente-telefone}          |

        Esquema do Cenário:CT23 - Valido dialog Alteração de serviço
            Dado que o usuário está na tela de confirmação da solicitação
            Quando clica no botão "Alterar" no container Tipo de assistência
            Então deverá ser exibido o dialog contendo <icone>, <titulo>, <mensagem>, <botao1>, <botao2>
            Exemplos:
                | icone         | titulo                              | mensagem                                                 | botao1 | botao2  |
                | {icone-aviso} | "Quer mesmo alterar a assistência?" | "Ao fazer isso, você precisará recomeçar a solicitação." | Fechar | Alterar |

        Cenário:CT24 - Valido botão "Fechar" no dialog Alteração de serviço
            Dado que foi exibido o dialog Alteração de serviço
            Quando o usuário clica no botão "Fechar"
            Então o dialog deverá ser fechado mantendo o usuário na tela de Confirmação da solicitação

        Cenário:CT25 - Valido botão "Alterar" no dialog Alteração de serviço
            Dado que foi exibido o dialog Alteração de serviço
            Quando o usuário clica no botão "Alterar"
            Então o usuário deverá ser direcionado para etapa "Tipo de assistência"

        Esquema do Cenário:CT26 - Valido dialog Alteração de data e horário
            Dado que o usuário está na tela de confirmação da solicitação
            Quando clica no botão "Alterar" no container Agendamento
            Então deverá ser exibido o dialog contendo <icone>, <titulo>, <mensagem>, <botao1>, <botao2>
            Exemplos:
                | icone         | titulo                                 | mensagem                                                 | botao1   | botao2  |
                | {icone-aviso} | "Quer mesmo alterar a data e horário?" | "Ao fazer isso, você precisará recomeçar a solicitação." | Cancelar | Alterar |

        Cenário:CT27 - Valido botão "Cancelar" no dialog Alteração de data e horário
            Dado que foi exibido o dialog Alteração de data e horário
            Quando o usuário clica no botão "Cancelar"
            Então o dialog deverá ser fechado mantendo o usuário na tela de Confirmação da solicitação

        Cenário:CT28 - Valido botão "Alterar" no dialog Alteração de data e horário
            Dado que foi exibido o dialog Alteração de data e horário
            Quando o usuário clica no botão "Alterar"
            Então o usuário deverá ser direcionado para a etapa "Agendamento"

        Esquema do Cenário:CT29 - Valido botão "Alterar" no container Endereço
            Dado que o usuário está na tela de Confirmação da solicitação
            Quando clica no botão "Alterar" no container Endereço
            Então deverá ser exibido o modal com o título "Confirme o endereço" e subtítulo "Confira e complemente, se for necessário."
            E abaixo do subtítulo deverá existir o container contendo <icone>, <info1>, <info2>
            E abaixo do container de endereço deverá existir o formulário contendo <campo>, <descricao>
            E abaixo do campo Referência ou observação deverá existir o botão "Continuar"
            E na parte superior direita do componente deverá existir o botão {x} que irá fechar o modal
            Exemplos:
                | icone            | info1           | info2         |
                | {icone-endereco} | {Rua}, {Numero} | {Cidade}-{UF} |
            Exemplos:
                | campo                               | descricao                                 |
                | Complemento (opcional)              | "Bloco/apartamento/casa"                  |
                | Referência ou observação (opcional) | "Ex.: um local que esteja próximo a você" |

        Esquema do Cenário:CT30 - Valido botão "Alterar" no container Contato
            Dado que o usuário está na tela de Confirmação da solicitação
            Quando clica no botão "Alterar" no container Contato
            Então deverá ser exibido o modal com título "Confirme os dados para contato"
            E abaixo do título deverá existir o formulário contendo <campo>, <dado>
            E abaixo do campo Telefone deverá existir o botão "Continuar"
            E na parte superior direita do componente deverá existir o botão {x} que irá fechar o modal
            Exemplos:
                | campo    | dado               |
                | Nome     | {cliente-nome}     |
                | Telefone | {cliente-telefone} |
        
        Cenário:CT31 - Valido preenchimento de nome incorreto
            Dado que o usuário está no modal de Confirmação de dados para contato
            Quando preenche o campo Nome com um dado incorreto
            Então o campo deverá assumir a cor "Vermelha"
            E abaixo do campo deverá existir a mensagem "Nome incorreto"

        Cenário:CT32 - Valido preenchimento de telefone incorreto
            Dado que o usuário está no modal de Confirmação de dados para contato
            Quando preenche o campo Telefone com um dado incorreto
            Então o campo deverá assumir a cor "Vermelha"
            E abaixo do campo deverá existir a mensagem "Telefone incorreto"

        Esquema do Cenário:CT33 - Valido tela de sucesso na solicitação de assistência
            Dado que o usuário está na tela de Confirmação da solicitação
            Quando clica no botão "Continuar"
            Então será exibida a tela de sucesso na solicitação de assistência com título "Tudo certo com seu agendamento" e subtítulo "Você pode consultar o status por meio da tela de acompanhamento."
            E acima do título deverá existir o ícone {icone-sucesso}
            E abaixo do subtítulo deverá existir o container contendo <icone>, <info1>, <info2>
            E abaixo do container com as inormações de data do agendamento deverá existir o formulário preenchido contendo <campo>, <dado>
            E abaixo do formulário deverá existir a mensagem "Protocolo\n +{assistencia-numero}"
            E à direita da mensagem com o número do protocolo deverá existir o botão "Copiar"
            E à direita do botão "Copiar" deverão existir os botões "Voltar ao início", "Acompanhar solicitação"
            Exemplos:
                | icone              | info1                                     | info2             |
                | {icone-calendario} | {Dia da semana} - {dia} de {mês} de {ano} | {hora ou período} |
            Exemplos:
                | campo               | dado                              |
                | Endereço            | {Rua}, {Numero}                   |
                | Tipo de assistência | {assistencia-tipo}                |
                | Item de assistência | {assistencia-item}                |
                | Contato             | {cliente-nome} {cliente-telefone} |

        Esquema do Cenário:CT34 - Valido dialog de erro ao confirmar solicitação
            Dado que o usuário está na tela de Confirmação da solicitação
            E clicou no botão "Continuar"
            Quando ocorre falha ao concluir a solicitação de assistência
            Então deverá ser exibido o dialog contendo <icone>, <mensagem>, <botao>
            Exemplos:
                | icone        | mensagem                                                                  | botao |
                | {icone-erro} | "Poxa, não foi possível solicitar assistência. Tente de novo mais tarde." | {x}   |

        Cenário:CT35 - Valido botão "Voltar ao início" na tela de sucesso na solicitação de assistência
            Dado que o usuário está na tela de sucesso na solicitação de assistência
            Quando clica no botão "Voltar ao início"
            Então deverá ser direcionado para a página inicial do Seguro residência

        Cenário:CT36 - Valido botão "Acompanhar solicitação" na tela de sucesso na solicitação de assistência
            Dado que o usuário está na tela de sucesso na solicitação de assistência
            Quando clica no botão "Acompanhar solicitação"
            Então deverá ser direcionado para o fluxo "acompanhamento-de-assistências"
                
        Esquema do Cenário:CT37 - Valido mensagem de erro
            Quando ocorre falha ao carregar alguma das informações da página
            Então na área da falha deverá ser apresentado o componente dialog contendo <icone>, <titulo>, <mensagem>, <botao>
            Exemplos:
                | icone         | titulo                                     | mensagem                     | botao            |
                | {icone-aviso} | "Não foi possível carregar as informações" | "Por favor tente novamente." | Tentar novamente |