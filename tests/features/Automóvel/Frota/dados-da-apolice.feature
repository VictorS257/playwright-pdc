# language: pt
Funcionalidade: Validar funcionamento do modal Dados da apólice do Seguro Auto-Frota

    Contexto: Acesso a funcionalidade Dados da apólice
        Dado que o usuário se autenticou no PDC
        E possui alguma apólice ativa de Seguro Auto-Frota
        E acessou o produto "Seguro Auto-Frota"
        E clicou na opção "Dados da apólice" disponível no scroll de Atalhos

        Cenário:CT01 - Valido loading
            Quando o sistema está recebendo as informações do modal
            Então os componentes abaixo do título do modal deverão estar em estado de carregamento

        Esquema do Cenário:CT02 - Valido conteúdo do modal Dados da apólice
            Quando o sistema recebe as informações do modal
            Então o título do modal deverá ser "Dados da apólice"
            E abaixo do título deverá existir o container dados da apolice contendo <icone>, <info1>, <info2>
            E abaixo dos dados da apólice deverá existir o botão select "Endossos"
            E abaixo do botão "Endosso" deverão existir as guias "Gerais", "Cadastrais"
            E na parte superior direita do componente deverá existir o botão {x} que irá fechar o modal
            Exemplos:
                | icone           | info1                    | info2          |
                | {icone-produto} | Apólice {apolice-numero} | {produto-nome} |

        Esquema do Cenário:CT03 - Valido guia Gerais
            Quando o sistema recebe as informações do modal
            Então na guia "Gerais" deverá ser criado o container com título "Apólice"
            E à direita do título do container deverá existir o botão "Baixar PDF"
            E o conteúdo do container deverá ser o formulário preenchido contendo <campo>, <dado>
            E abaixo do container com as informações da apólice deverá existir o container Meu corretor com o título "Precisa de ajuda?"
            Exemplos:
                | campo                 | dado               |
                | "Número da proposta"  | {proposta-numero}  |
                | "Emissão"             | {emissao}          |
                | "Tipo de contratação" | {contratacao}      |
                | "Apólice atual"       | {apolice-numero}   |
                | "Apólice anterior"    | {apolice-anterior} |
                | "Vigência"            | {apolice-vigencia} |

        Cenário:CT04 - Valido funcinamento do botão Baixar PDF
            Dado que as informações gerais foram exibidas
            Quando o usuário clica no botão "Baixar PDF" no container de informações da apólice
            Então deverá ser iniciado o fluxo "baixar-apolice"

        Cenário:CT05 - Valido direcionamento do container Meu corretor
            Dado que as informações gerais foram exibidas
            Quando o usuário clica no container Meu corretor
            Então deverá ser exibido o modal Meu corretor

        Regra: Usuário PF
            Esquema do Cenário:CT06 - Valido guia Cadastrais
                Dado que o sistema recebeu as informações do modal
                Quando o usuário clica na guia "Cadastrais"
                Então deverá ser exibido o formulário preenchido com o título "Segurado(a)" contendo <campo>, <dado>
                E o campo "CEP" deverá estar parcialmente mascarado
                Exemplos:
                    | campo       | dado               |
                    | Nome social | {*nome-social*}    |
                    | Nome civil  | {nome-completo}    |
                    | Endereço    | {cliente-endereco} |
                    | Cidade      | {cliente-cidade}   |
                    | Estado      | {cliente-uf}       |
                    | Bairro      | {cliente-bairro}   |
                    | CEP         | {cliente-cep}      |

        Regra: Usuário PJ
            Esquema do Cenário:CT07 - Valido guia Cadastrais
                Dado que o sistema recebeu as informações do modal
                Quando o usuário clica na guia "Cadastrais"
                Então deverá ser exibido o formulário preenchido com o título "Segurado(a)" contendo <campo>, <dado>
                E o campo "CEP" deverá estar parcialmente mascarado
                Exemplos:
                    | campo                | dado               |
                    | Razão social         | {*razão-social*}   |
                    | Nome civil           | {nome-completo}    |
                    | Endereço             | {cliente-endereco} |
                    | Cidade               | {cliente-cidade}   |
                    | Estado               | {cliente-uf}       |
                    | Bairro               | {cliente-bairro}   |
                    | CEP                  | {cliente-cep}      |
                    | Atividade da empresa | {atividade}        |

        Esquema do Cenário:CT08 - Valido mensagem de erro
            Quando ocorre falha ao carregar alguma das informações do modal
            Então na área da falha deverá ser apresentado o componente dialog contendo <icone>, <titulo>, <mensagem>, <botao>
            Exemplos:
                | icone         | titulo                                     | mensagem                     | botao            |
                | {icone-aviso} | "Não foi possível carregar as informações" | "Por favor tente novamente." | Tentar novamente |