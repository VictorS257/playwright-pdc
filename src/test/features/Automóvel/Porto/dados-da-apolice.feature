# language: pt
Funcionalidade: Validar funcionamento do modal Dados da apólice do Seguro Automóvel

    Contexto: Acesso a funcionalidade Dados da apólice
        Dado que o usuário se autenticou no PDC
        E possui alguma apólice ativa de Seguro Auto-Azul
        E acessou o produto "Seguro Automóvel"
        E clicou na opção "Dados da apólice" disponível no scroll de Atalhos

        Cenário:CT01 - Valido loading
            Quando o sistema está recebendo as informações do modal
            Então os componentes abaixo do título do modal deverão estar em estado de carregamento

        Esquema do Cenário:CT02 - Valido conteúdo do modal Dados da apólice
            Dado que o usuário está utilizando a visualização mobile
            Quando é exibido o modal com o o titulo "Dados da apólice"
            Então abaixo do título do modal deverá existir o container dados da apolice contendo <icone>, <titulo>, <mensagem>, <botao>
            E abaixo dos dados da apólice deverão existir as guias "Gerais", "Cadastrais", "Item segurado"
            E na parte superior direita do componente deverá existir o botão {x} que irá fechar o modal
            Exemplos:
                | icone           | titulo                         | mensagem       | botao           |
                | {icone-produto} | {Marca} {Modelo}-{placa-final} | {produto-nome} | Alterar apólice |
                
        Esquema do Cenário:CT03 - Valido guia Gerais
            Quando o sistema recebe as informações do modal
            Então na guia "Gerais" deverá ser criado o container com título "Apólice"
            E à direita do título do container deverá existir o botão "Ver PDF"
            E o conteúdo do container deverá ser o formulário preenchido contendo <campo>, <dado>
            E ao lado dos campos "Item" e "Código CI" deverão existir os botões de informações
            E abaixo do container com as informações da apólice deverá existir o container Meu corretor com o título "Precisa de ajuda?"
            Exemplos:
                | campo           | dado                             |
                | Número          | {apolice-numero}                 |
                | Data de emissão | {apolice-emissao}                |
                | Item            | {Item}                           |
                | Código CI       | {codigo-ci}                      |
                | Classe Bônus    | {classe-bonus}                   |
                | Vigência        | {data-inicio}+" até "+{data-fim} |

        Cenário:CT04 - Valido funcinamento do botão Ver PDF
            Dado que as informações gerais foram exibidas
            Quando o usuário clica no botão "Ver PDF" no container de informações da apólice
            Então deverá ser iniciado o fluxo "ver-apolice"

        Esquema do Cenário:CT05 - Valido funcionamento do dialog Item
            Dado que as informações gerais foram exibidas
            Quando o usuário clica no botão de informações ao lado do campo "Item"
            Então deverá ser apresentado o componente dialog contendo <icone>, <titulo>, <mensagem>, <botao>
            Exemplos:
                | icone         | titulo | mensagem                                                                  | botao   |
                | {icone-aviso} | "Item" | "O número do item serve para diferenciar os equipamentos da sua apólice." | Entendi |

        Cenário:CT06 - Valido funcionamento o botão Entendi no dialog Item
            Dado que o usuário clicou no botão de informações do campo Item
            Quando o usuário clica no botão "Entendi"
            Então o componente dialog deve ser fechado mantendo o usuário na tela de dados da apólice

        Esquema do Cenário:CT07 - Valido funcionamento do dialog Código CI
            Dado que as informações gerais foram exibidas
            Quando o usuário clica no botão de informações ao lado do campo "Código CI"
            Então deverá ser apresentado o componente dialog contendo <icone>, <titulo>, <mensagem>, <botao>
            Exemplos:
                | icone         | titulo       | mensagem                                                                                                           | botao   |
                | {icone-aviso} | "Código CI"  | "O Código de Identificação (CI) é um código que valida as informações apresentadas na sua apólice atual/anterior." | Entendi |

        Cenário:CT08 - Valido funcionamento o botão Entendi no dialog  Código CI
            Dado que o usuário clicou no botão de informações do campo Código CI
            Quando o usuário clica no botão "Entendi"
            Então o componente dialog deve ser fechado mantendo o usuário na tela de dados da apólice

        Cenário:CT09 - Valido direcionamento do container Meu corretor
            Dado que as informações gerais foram exibidas
            Quando o usuário clica no container Meu corretor
            Então deverá ser exibido o modal Meu corretor

        Esquema do Cenário:CT10 - Valido guia Cadastrais
            Dado que o sistema recebeu as informações do modal
            Quando o usuário clica na guia "Cadastrais"
            Então deverá ser exibido o formulário preenchido com o título "Segurado(a)" contendo <campo>, <dado>
            E os campos "Email", "CEP" e "Telefones" devem estar parcialmente mascarados
            Exemplos:
                | campo       | dado               |
                | Nome social | {*nome-social*}    |
                | Nome civil  | {nome-completo}    |
                | Endereço    | {cliente-endereco} |
                | Cidade      | {cliente-cidade}   |
                | Estado      | {cliente-uf}       |
                | Bairro      | {cliente-bairro}   |
                | CEP         | {cliente-cep}      |
                | Email       | {email}            |
                | Telefones   | {telefones}        |

        Esquema do Cenário:CT11 - Valido guia Item segurado
            Dado que o sistema recebeu as informações do modal
            Quando o usuário clica na guia "Item segurado"
            Então deverá ser exibido o formulário preenchido com o título "Veículo" contendo <campo>, <dado>
            E o campo "CEP de pernoite do veículo" deve estar parcialmente mascarado
            Exemplos:
                | campo                      | dado                  |
                | Modelo/Versão              | {veiculo-modelo}      |
                | Marca                      | {veiculo-marca}       |
                | Placa                      | {veiculo-placa}       |
                | Ano                        | {veiculo-ano}         |
                | Chassi                     | {veiculo-chaci}       |
                | Câmbio Automático          | {opcao-cambio}        |
                | Uso                        | {tipo-uso}            |
                | Combustível                | {veiculo-combustivel} |
                | CEP de pernoite do veículo | {cep-pernoite}        |
                
        Cenário:CT12 - Valido funcionamento do botão Alterar apólice
            Dado que as informações da apólice foram recebidas
            Quando o usuário clica no botão "Alterar apólice"
            Então deverá ser exibido o modal Selecionar apólice

        Esquema do Cenário:CT13 - Valido mensagem de erro
            Quando ocorre falha ao carregar alguma das informações do modal
            Então na área da falha deverá ser apresentado o componente dialog contendo <icone>, <titulo>, <mensagem>, <botao>
            Exemplos:
                | icone         | titulo                                     | mensagem                     | botao            |
                | {icone-aviso} | "Não foi possível carregar as informações" | "Por favor tente novamente." | Tentar novamente |