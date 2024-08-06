# language: pt
Funcionalidade: Validar funcionamento do modal Meu corretor do Seguro Auto-Frota

    Contexto:Acesso a funcionalidade Meu corretor
        Dado que o usuário se autenticou no PDC
        E acessou o produto "Seguro Auto-Frota"
        E clicou no link "Ver contatos" no container Meu corretor
        E foi exibido o modal Meu corretor

        Cenário:CT01 - Valido loading
            Quando o sistema está recebendo as informações do modal
            Então os componentes abaixo do título do modal deverão estar em estado de carregamento

        Regra:Cliente sem produtos
            Esquema do Cenário:CT02 - Valido exibição dos dados do corretor para cliente sem produto PortoSeguro
                Dado que o usuário não possui nenhum produto PortoSeguro ativo
                Quando o carregamento do modal Meu corretor ocorre com sucesso
                Então o modal deverá conter a estrutura <h1>, <mensagem>
                E abaixo das informações do corretor deverá existir o componente lista de itens contendo <icone>, <item>, <icone-interativo>
                E na parte superior direita do componente deverá existir o botão {x} que irá fechar o modal
                Exemplos:
                    | h1              | mensagem                   |
                    | {corretor-nome} | "SUSEP n.º "{susep-numero} |
                Exemplos:
                    | icone            | item                | icone-interativo |
                    | {icone-telefone} | {corretor-telefone} | {>}              |
                    | {icone-email}    | {corretor-email}    | {>}              |

        #Regras 1 ou mais produtos > Mesmo cenário, porém muda o título do componente scroll de itens
        Regra:Cliente com um produto
            Esquema do Cenário:CT03 - Valido exibição dos dados do corretor e de apólice
                Dado que o usuário possui apenas um produto PortoSeguro ativo
                Quando o carregamento do modal Meu corretor ocorre com sucesso
                Então o modal deverá conter a estrutura <h1>, <mensagem>
                E abaixo das informações do corretor deverá existir o componente scroll horizontal com título "Cuida de "+{qtd-produtos}+" item para você:" contendo <icone>, <titulo>, <h1>, <dados>, <icone-interativo>
                E abaixo do componente scroll de produtos deverá existir o componente lista de itens contendo <icone>, <dado>, <icone-interativo>
                E na parte superior direita do componente deverá existir o botão {x} que irá fechar o modal
                Exemplos:
                    | h1              | mensagem                    |
                    | {corretor-nome} | "SUSEP n.º "+{susep-numero} |
                Exemplos:
                    | icone           | titulo         | h1               | dados         | icone-interativo |
                    | {icone-produto} | {produto-nome} | {Marca} {Modelo} | {placa-final} | {>}              |
                Exemplos:
                    | icone            | dado                | icone-interativo |
                    | {icone-telefone} | {corretor-telefone} | {>}              |
                    | {icone-email}    | {corretor-email}    | {>}              |

        Regra:Cliente com mais de um produto
            Esquema do Cenário:CT04 - Valido exibição dos dados do corretor e das apólices
                Dado que o usuário possui mais de um produto PortoSeguro ativo
                Quando o carregamento do modal Meu corretor ocorre com sucesso
                Então o modal deverá conter a estrutura <h1>, <mensagem>
                E abaixo das informações do corretor deverá existir o componente scroll horizontal com título "Cuida de "+{qtd-produtos}+" itens para você:"
                E para cada produto PortoSeguro ativo do usuário será criado um item no carrosel contendo <icone>, <titulo>, <h1>, <dados>, <icone-interativo>
                E abaixo do componente scroll de produtos deverá existir o componente lista de itens contendo <icone>, <dado>, <icone-interativo>
                E na parte superior direita do componente deverá existir o botão {x} que irá fechar o modal
                Exemplos:
                    | h1              | mensagem                    |
                    | {corretor-nome} | "SUSEP n.º "+{susep-numero} |
                Exemplos:
                    | icone           | titulo         | h1               | dados         | icone-interativo |
                    | {icone-produto} | {produto-nome} | {Marca} {Modelo} | {placa-final} | {>}              |
                Exemplos:
                    | icone            | dado                | icone-interativo |
                    | {icone-telefone} | {corretor-telefone} | {>}              |
                    | {icone-email}    | {corretor-email}    | {>}              |

        Regra:Usuário com mais de um corretor
            Esquema do Cenário: Valido exibição de múltiplos corretores
                Dado que o usuário possui mais de um corretor
                Quando o carregamento do modal Meu corretor ocorre com sucesso
                Então o título do modal deverá ser "Meus corretores"
                E para cada corretor deverá ser criado um item na vertical contendo <h1>, <mensagem>
                E abaixo das informações do corretor deverá existir o componente scroll horizontal com título "Cuida de "+{qtd-produtos}+" itens para você:"
                E para cada produto PortoSeguro ativo do usuário será criado um item no carrosel contendo <icone>, <titulo>, <h1>, <dados>, <icone-interativo>
                E abaixo do componente scroll de produtos deverá existir o componente lista de itens contendo <icone>, <dado>, <icone-interativo>
                Exemplos:
                    | h1              | mensagem                    |
                    | {corretor-nome} | "SUSEP n.º "+{susep-numero} |
                Exemplos:
                    | icone           | titulo         | h1               | dados         | icone-interativo |
                    | {icone-produto} | {produto-nome} | {Marca} {Modelo} | {placa-final} | {>}              |
                Exemplos:
                    | icone            | dado                | icone-interativo |
                    | {icone-telefone} | {corretor-telefone} | {>}              |
                    | {icone-email}    | {corretor-email}    | {>}              |

        Cenário:CT05 - Valido direcionamento para o telefone
            Dado que as informações do modal Meu corretor foram exibidas
            Quando o usuário clica bo item {corretor-telefone}
            Então o dado deverá ser copiado para a área de transferência

        Cenário:CT06 - Valido direcionamento para o email
            Dado que as informações do modal Meu corretor foram exibidas
            Quando o usuário clica bo item {corretor-email}
            Então o dado deverá ser copiado para a área de transferência

        Esquema do Cenário:CT07 - Valido mensagem de erro timeout
            Quando ocorre falha ao receber as informações do modal
            Então a área do modal deve conter <icone>, <titulo>, <mensagem>, <botao>
            Exemplos:
                | icone           | titulo                                     | mensagem                   | botao            |
                | {aviso-circulo} | "Não foi possível carregar as informações" | Por favor tente novamente. | Tentar novamente |

        Esquema do Cenário:CT08 - Valido mensagem de erro sistema indisponível
            Quando ocorre falha na conexão com o servidor
            Então a área do modal deve conter <icone>, <titulo>, <mensagem>, <botao>
            Exemplos:
                | icone             | titulo                                       | mensagem                                                                                                | botao                |
                | {aviso-triangulo} | "Nosso sistema está indisponível no momento" | "Estamos trabalhando para que volte a funcionar o quanto antes. Por favor, tente novamente mais tarde." | Voltar para o início |
