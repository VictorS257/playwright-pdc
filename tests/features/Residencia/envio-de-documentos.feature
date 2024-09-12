# language: pt
Funcionalidade: Validar funcionamento da tela Envio de documentos do Seguro Residência

    Contexto: Acesso a tela Envio de documentos
        Dado que o usuário se autenticou no PDC
        E acessou o produto "Seguro Residência"
        E navegou até a opção "Meus sinistros > Novo envio de documentos"

        Cenário:CT01 - Valido loading
            Quando o sistema está recebendo as informações da tela
            Então todos os componentes abaixo do título da página deverão estar em estado de carregamento

        Regra: Visualização web
            Esquema do Cenário:CT02 - Valido funcionamento do header
                Quando o usuário navega entre as telas da aplicação
                Então deve ser sempre exibido o componente header contendo <icone>, <botao1>, <botao2>, <icone-interativo>
                Exemplos:
                    | icone               | botao1                  | botao2                               | icone-interativo |
                    | {icone-portoseguro} | "Dúvidas "+{icone-faq}  | {icone-menu-usuario}+{nome-usuario}  | {>}              |

            Esquema do Cenário:CT03 - Valido funcionamento do componente breadcrumb
                Quando o usuário navega entre as telas da aplicação
                Então abaixo do header deverá existir o componente breadcrumb contendo <botao>, <path>
                Exemplos:
                    | botao    | path   |
                    | {voltar} | {path} |

        Regra: Visualização mobile
            Esquema do Cenário:CT04 - Valido funcionamento do header
                Quando o usuário navega entre as telas da aplicação
                Então deve ser sempre exibido o componente header contendo <icone>, <botao1>, <botao2>
                Exemplos:
                    | icone               | botao1 | botao2          |
                    | {icone-portoseguro} | {faq}  | {menu-usuario}  |

            Esquema do Cenário:CT05 - Valido funcionamento do componente breadcrumb
                Quando o usuário navega entre as telas da aplicação
                Então abaixo do header deverá existir o componente breadcrumb contendo <botao>, <mensagem>
                Exemplos:
                    | botao    | mensagem |
                    | {voltar} | Voltar   |

        Esquema do Cenário:CT06 - Valido exibição dos dados da apólice
            Quando o sistema recebe as informações da tela
            Então abaixo do componente breadcrumb deverá existir o container de informações da apólice contendo <icone>, <titulo>, <mensagem>, <botao>
            Exemplos:
                | icone           | titulo          | mensagem       | botao           |
                | {icone-produto} | {Rua}, {Numero} | {produto-ramo} | Alterar apólice |

        Esquema do Cenário:CT07 - Valido exibição da listagem de sinistros
            Quando o sistema recebe as informações da tela 
            Então abaixo das informações da apólice deverá existir a lista de itens com o título "Envio de documentos" e subtítulo "Selecione os sinistros para enviar, visualizar ou remover documentos."
            E para cada sinistro vinculado à apólice deverá ser criado um item na lista contendo <icone>, <titulo>, <info>, <status>, <icone-interativo>
            E para os sinistros com status "Envio de documentos", "Novo envio de documentos" deverá ser exibido o botão "Enviar documentos"
            E para os sinistros com status "Envio de documentos", "Novo envio de documentos" deverá existir a mensagem "Estamos aguardando você enviar a documentação até o dia {data-limite}"
            Exemplos:
                | icone             | titulo           | info                           | status            | icone-interativo |
                | {icone-cobertura} | {cobertura-nome} | "Sinistro: "+{sinistro-numero} | {sinistro-status} | {>}              |

        Esquema do Cenário:CT08 - Valido página de envio de documentos
            Dado que o usuário clicou em algum dos sinistros da lista
            Quando o sistema recebe as informações da tela
            Então abaixo do componente breadcrumb deverá existir o título "Envio de documentos" e o subtítulo "Envie os documentos listados para darmos andamento à análise. Após o envio, você pode acompanhar o status por meio da tela de acompanhamento."
            E deverá existir o formulário preenchido com as informações do sinistro contendo <campo>, <dado>
            E abaixo do formulário com as informações do sinistro deverá existir o botão "Voltar para Meus sinistros"
            Exemplos:
                | campo               | dado               |
                | Sinistro            | {sinistro-numero}  |
                | Data da solicitação | {sinistro-data}    |

        Esquema do Cenário:CT09 - Valido listagem de itens pendentes
            Dado que o usuário possui algum documento pendente relacionado ao sinistro
            Quando o sistema recebe as informações da tela
            Então deverá existir a lista de itens com título "Pendente"
            E para cada documento pendente deverá ser criado um container na lista contendo <icone>, <titulo>, <mensagem>, <info>
            E abaixo da descrição do documento deverá ser exibido o dialog com a mensagem "Envie o arquivo totalizando até 4 MB nos formatos {doc-formatos}."
            E abaixo do dialog deverá existir o botão "Importar arquivo"
            Exemplos:
                | icone             | titulo           | mensagem              | info        |
                | {icone-documento} | {documento-nome} | {documento-descricao} | {doc-prazo} |

        Esquema do Cenário:CT10 - Valido listagem de itens enviados
            Dado que o usuário possui algum documento enviado relacionado ao sinistro
            Quando o sistema recebe as informações da tela
            Então deverá existir a lista de itens com título "Enviados"
            E para cada documento enviado deverá ser criado um container na lista contendo <icone>, <status>, <titulo>, <mensagem>, <info>
            E abaixo da data do sinistro deverá ser exibido o dialog com a mensagem "Envie o arquivo totalizando até 4 MB nos formatos {doc-formatos}."
            E abaixo do dialog deverá existir uma prévia do documento contendo {documento-nome}, {documento-tamanho}
            E à direita dos dados do documento deverá existir o botão {x} que irá cancelar o envio do documento
            E abaixo dos dados do documento deverá existir o contador de tamanho total de arquivo
            Exemplos:
                | icone             | status             | titulo           | mensagem              | info       |
                | {icone-documento} | {documento-status} | {documento-nome} | {documento-descricao} | {doc-data} |

        Cenário:CT11 - Valido visualização do documento
            Dado que o usuário possui algum documento com status "Enviado" vinculado ao sinistro
            Quando clica no item com as informações do documento
            Então deverá ser aberto o documento na visualização nativa do dispositivo

        Esquema do Cenário:CT12 - Valido mensagem de erro ao carregar informações da página
            Quando ocorre falha ao carregar alguma das informações da página
            Então na área da falha deverão ser apresentadas as informações <icone>, <titulo>, <mensagem>, <botao>
            Exemplos:
                | icone         | titulo                                     | mensagem                      | botao            |
                | {icone-aviso} | "Não foi possível carregar as informações" | "Por favor, tente novamente." | Tentar novamente |

        Esquema do Cenário:CT13 - Valido erro ao importar documento
        Dado que o usuário seleciona um documento para realizar o uploadl
            Quando ocorre falha ao carregar o documento
            Então no lugar das informações do documento deverá ser apresentado o componente dialog clicável contendo <icone>, <titulo>, <mensagem>
            Exemplos:
                | icone          | titulo                     | mensagem                      |
                | {icone-reload} | "Erro ao importar arquivo" | "Por favor, tente novamente." |
