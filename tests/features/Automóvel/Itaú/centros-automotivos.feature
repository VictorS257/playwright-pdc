# language: pt
Funcionalidade: Validar funcionamento da tela Centros Automotivos do Seguro Auto-Itaú

    Contexto: Acesso a tela Centros Automotivos
        Dado que o usuário se autenticou no PDC
        E acessou o produto "Seguro Auto-Itaú"
        E clicou na opção Centros Automotivos em "Menu > Assistências"

        Cenário:CT01 - Valido loading
            Quando o sistema está recebendo as informações da tela
            Então todos os componentes abaixo do componente breadcrumb deverão estar em estado de carregamento

        Regra: Visualização web
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

            Cenário:CT04 - Valido exibição das informações da tela
                Quando o sistema recebe as informações da tela
                Então abaixo do componente breadcrumb deverá existir o título "Centros Automotivos"
                E abaixo do título deverá existir o subtítulo "Encontre o Centro Automotivo Porto mais próximo de você."
                E abaixo do subtítulo deverá existir a mensagem "Exibindo os {qtd-centros} centros mais próximos de você:"
                E abaixo da mensagem deverá existir a barra de pesquisa com placeholder "Digite sua localização"
                E abaixo da barra de pesquisa deverá existir o componente mapa
                E na parte superior direita da página deverá existir o botão "Solicitar Assistência"
                E abaixo do botão "Solicitar Assistência" deverá existir o container Meu corretor
                E na parte inferior direita da tela deverá existir o botão "WhatsApp"

            Esquema do Cenário:CT05 - Valido componente mapa
                Quando existem centros automotivos Porto na região em exibição no mapa
                Então cada centro automotivo Porto na região deverá estar destacado no mapa
                E cada centro automotivo Porto na região deverá ser listado à esquerda do mapa contendo <titulo>, <endereco>, <link>, <botao>
                Exemplos:
                    | titulo        | endereco          | link            | botao          |
                    | {centro-nome} | {centro-endereco} | Exibir detalhes | Exibir no mapa |

            Esquema do Cenário:CT06 - Valido clique em algum centro automotivo destacado no mapa
                Dado que foram destacados os centros automotivos Porto no mapa
                Quando o usuário clica no ícone de algum centro automotivo exibido
                Então deverá ser exibido o dialog contendo <titulo>, <endereco>, <link1>, <link2>, <link3>
                E na parte superior direita do componente deverá existir o botão {x} que irá fechar dialog
                Exemplos:
                    | titulo        | endereco          | link1           | link2       | link3        |
                    | {centro-nome} | {centro-endereco} | Exibir detalhes | Traçar rota | Visão da rua |

        Regra: Visualização mobile
            Esquema do Cenário:CT07 - Valido funcionamento do header
                    Quando o usuário navega entre as telas da aplicação
                    Então deve ser sempre exibido o componente header contendo <icone>, <botao1>, <botao2>
                    Exemplos:
                        | icone               | botao1 | botao2          |
                        | {icone-portoseguro} | {faq}  | {menu-usuario}  |

                Esquema do Cenário:CT08 - Valido funcionamento do componente breadcrumb
                    Quando o usuário navega entre as telas da aplicação
                    Então abaixo do header deverá existir o componente breadcrumb contendo <botao>, <mensagem>
                    Exemplos:
                        | botao    | mensagem |
                        | {voltar} | Voltar   |
                        
                Cenário:CT09 - Valido exibição das informações da tela
                    Dado que o usuário está utilizando a visualização mobile
                    Quando o sistema recebe as informações da tela
                    Então abaixo do componente breadcrumb deverá existir o título "Centros Automotivos"
                    E abaixo do título deverá existir o subtítulo "Encontre o Centro Automotivo Porto mais próximo de você."
                    E abaixo do subtítulo deverá existir a mensagem "Exibindo os {qtd-centros} centros mais próximos de você:"
                    E abaixo da mensagem deverá existir a barra de pesquisa com placeholder "Digite sua localização"
                    E abaixo da barra de pesquisa deverá existir o componente mapa
                    E abaixo do componente mapa deverá existir o botão "Solicitar Assistência"
                    E abaixo do botão "Solicitar Assistência" deverá existir o container Meu corretor
                    E no rodapé da página deverá existir o botão "WhatsApp"

                Cenário:CT10 - Valido componente mapa
                    Quando existem centros automotivos Porto na região em exibição no mapa
                    Então cada centro automotivo Porto na região deverá estar destacado no mapa

        Cenário:CT11 - valido erro ao não permitir localização
            Quando a o acessp à localização do dispositivo não está habilitada
            Então no componente mapa deverá ser exibido o dialog nativo do mapa informando que o componente está inacessível
            E deverá ser habilitado o botão "Usar localização atual"

        Cenário:CT12 - Valido busca sem resultados
            Quando o usuário realiza uma busca que não encontra resultados
            Então no componente mapa deverá ser exibida a mensagem "Nenhum centro automotivo encontrado"
            E deverá ser exibido o botão "Realizar nova busca"
            
        Esquema do Cenário:CT12 - Valido detalhes do centro automotivo
            Dado que existem centros automotivos Porto na região em exibição no mapa
            Quando o usuário clica no link "Ver detalhes" em algum Centro Automotivo
            Então deverá ser exibido o mocal com o título {centro-nome}
            E abaixo do título do modal deverá existir o formulário preenchido com título "Informações de contato" contendo <campo>, <dado>
            E abaixo do formulário Informações de contato deverá existir o container com o título "Serviços atendidos"
            E para cada serviço oferecido pelo centro automotivo deverá ser criado um bulletpoint no container com o nome do serviço
            Exemplos:
                | campo       | dado                         |
                | Endereço    | {centro-endereco}            |
                | Referência  | {centro-referencia}          |
                | Telefone    | {centro-telefone}            |
                | CEP         | {centro-cep}                 |
                | Atendimento | {centro-horario-atendimento} |
                | Observação  | {centro-observacao}          |

        Esquema do Cenário:CT13 - Valido mensagem de erro ao carregar os Centros automotivos
            Quando ocorre falha ao carregar alguma das informações da página Centros Automotivos
            Então abaixo do título da página deverá ser apresentado o componente dialog contendo <icone>, <titulo>, <mensagem>, <botao>
            Exemplos:
                | icone         | titulo                                     | mensagem                     | botao            |
                | {icone-aviso} | "Não foi possível carregar as informações" | "Por favor tente novamente." | Tentar novamente |

        Esquema do Cenário:CT14 - Valido mensagem de erro ao carregar os detalhes do Centro automotivo
            Dado que o usuário clicou no link "Ver detalhes" em algum Centro Automotivo
            Quando ocorre falha ao carregar os detalhes do Centro Automotivo
            Então abaixo do título do modal deverá ser apresentado o componente dialog contendo <icone>, <titulo>, <mensagem>, <botao>
            Exemplos:
                | icone         | titulo                                     | mensagem                     | botao            |
                | {icone-aviso} | "Não foi possível carregar as informações" | "Por favor tente novamente." | Tentar novamente |