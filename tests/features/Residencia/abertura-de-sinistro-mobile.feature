# language: pt
Funcionalidade: Validar funcionamento da tela Abertura de sinistro do Seguro Residência na versão mobile

    Contexto: Acesos a tela Abertura de sinistro
        Dado que o usuário se autenticou no PDC
        E está utilizando a visualização mobile
        E acessou o produto "Seguro Residência"
        E clicou na opção "Novo aviso de sinistro" no scroll Ações rápidas

        Cenário:CT01 - Valido loading
            Quando o sistema está recebendo as informações da tela
            Então todos os componentes abaixo do componente breadcrumb deverão estar em estado de carregamento

        Esquema do Cenário:CT02 - Valido funcionamento do header
            Quando o usuário navega entre as telas da aplicação
            Então deve ser sempre exibido o componente header contendo <icone>, <botao1>, <botao2>
            Exemplos:
                | icone               | botao1 | botao2          |
                | {icone-portoseguro} | {faq}  | {menu-usuario}  |

        Esquema do Cenário:CT03 - Valido funcionamento do componente breadcrumb
            Quando o usuário navega entre as telas da aplicação
            Então abaixo do header deverá existir o componente breadcrumb contendo <botao>, <mensagem>
            Exemplos:
                | botao    | mensagem |
                | {voltar} | Voltar   |

        Cenário:CT04 - Valido componente checklist
            Quando o sistema recebe as informações da tela
            Então abaixo do componente breadcrumb deverá existir um checklist simplificado indicando a etapa atual do processo de abertura de sinistro
            E o título do checklist deverá ser a etapa atual do processo
            E abaixo do contador de etapa deverá existir o botão "Exibir resumo"

        Cenário:CT05 - Valido botão "Exibir resumo" no checklist
            Quando o usuário clica no botão "Exibir resumo" exibido no checklist de abertura de Sinistro
            Então deverá ser exibido o drawer com move in up com título "Resumo"
            E abaixo do título deverá ser exibido o checklist detalhado com as etapas "Data e local da ocorrência", "Informações", "Confirmação"
            E a etapa "Data e local da ocorrência" devrá possuir os subitens "Data", "Endereço"
            E a etapa "Informações" deverá possuir os subitens "Ocorrência", "Dados bancários", "Contato"
            E abaixo do checklist deverão existir os containers "Informações detalhadas da apólice", "Meu Corretor"
            E na parte superior direita do componente deverá existir o botão {x} que irá fechar o drawer

        Esquema do Cenário:CT06 - Valido exibição das informações detalhadas da apólice
            Quando o usuário clica no botão "Exibir resumo" no checklist
            Então abaixo do checklist detalhado deverá existir o formulário preenchido contendo <campo>, <dado>
            Exemplos:
                | campo            | dado                 |
                | Nome do segurado | {segurado-nome}      |
                | CPF/CNPJ         | {segurado-documento} |
                | Data da vigência | {apolice-vigencia}   |

        Cenário:CT07 - Valido exibição do container Meu Corretor
            Quando o usuário clica no botão "Exibir resumo" no checklist
            Então abaixo do checklist detalhado deverá existir o container "Meu Corretor"

        Esquema do Cenário:CT08 - Valido tela "Data e local da ocorrência"
            Quando o sistema recebe as informações da tela
            Então abaixo do checklist resumido deverá existir o título "Informe quando e onde aconteceu o sinistro"
            E abaixo do título da página deverá existir o container com título "Data" 
            E abaixo do título do container deverá existir o campo do tipo calendário com placeholder "Data"
            E abaixo do campo "Data" deverá existir o formulário com o título "Local" contendo os camos "CEP", "Endereço", "Número", "Complemento", "Bairro", "Cidade", "Estado", "Pais"
            E à direita do campo "CEP" deverá existir o botão "Buscar" que irá preencher o campos  "Endereço", "Bairro", "Cidade", "Estado", "Pais" de acordo com o CEP informado
            E para cada campo preenchido do formulário deverá ser habilitado o botão {x} que irá limpar o campo
            E na parte inferior da tela deverá existir o botão "Continuar"
 
        Cenário:CT09 - Valido mensagem de "CEP incorreto"
            Dado que o usuário informa um dado incorreto no campo "CEP"
            Quando clica no botão "Buscar"
            Então o campo "CEP" deverá assumir a cor vermelha
            E deverá ser exibido o {icone-aviso} à esquerda do botão {x}
            E abaixo do campo deverá ser exibida a mensagem "CEP incorreto"

        Cenário:CT10 - Valido campos obrigatórios
            Dado que o usuário não preenche algum dos campos dos formulários
            Quando clica no botão "Continuar"
            Então o campo não preenchido deverá assumir a cor vermelha
            E deverá ser exibido o {icone-aviso} à esquerda do botão {x}
            E abaixo do campo deverá ser exibida a mensagem "Campo obrigatório"
            E apenas o campo "Complemento" não será obrigatório

        Cenário:CT11 - Valido tela "Informações"
            Dado que o usuário preencheu a tela "Data e local da ocorrência"
            Quando o usuário clica no botão "Continuar"
            Então será exibida a tela Informações com o título "Abertura de sinistros patrimoniais" 
            E abaixo do título da página deverão existir os formulários "Ocorrência", "Dados bancários", "Contato"
            E abaixo dos formulários deverão existir os botões "Voltar", "Continuar"

        Esquema do Cenário:CT12 - Valido formulário "Ocorrência"
            Quando o usuário está na tela Informações
            Então abaixo do título da página deverá existir o o formulário com título "Ocorrência" contendo os campos <campo> do tipo <tipo>
            E o campo "Cobertura acionada" só será habilitado após seleção de alguma das opções do campo "Natureza do sinistro"
            E abaixo do campo "Cobertura acionada" deverá existir o botão do tipo select com a mensagem "Tem um orçamento prévio?" com as opções "Não", "Sim"
            E o campo "Tem um orçamento prévio?" deverá estar com a opção "Não" selecionada
            E abaixo do campo "Detalhes da ocorrência" deverá existir o botão do tipo select com a mensagem "Tem seguro em outra seguradora?" com as opções "Sim", "Não"
            E o campo "Detalhes da ocorrência" deverá posuir limite de 175 caracteres
            Exemplos:
                | campo                       | tipo     |
                | Natureza do sinistro        | select   |
                | Cobertura acionada          | select   |
                | Faixa do prejuízo           | select   |
                | Detalhe da ocorrência       | textarea |

        Cenário:CT13 - Valido opção "Sim" no campo "Tem um orçamento prévio?"
            Quando o usuário seleciona a opção "Sim" no campo "Tem um orçamento prévio?" 
            Então o campo "Faixa do prejuízo" deverá ser substituído pelo campo do tipo input "Valor estimado"

        Esquema do Cenário:CT14 - Valido formulário "Dados bancários"
            Quando o usuário está na tela Informações
            Então abaixo do formulário "Ocorrência" deverá existir o formulário com o título "Dados bancários" contendo os campos <campo> do tipo <tipo>
            E os campos "Agência", "Conta", "Dígito" deverão permitir apenas números
            E acima dos campos deverá existir o dialog contendo <icone>, <mensagem>
            E ao digitar alguma informação nos campos do tipo textbox deverá ser habilidado no campo o botão {limpar}
            Exemplos:
                | campo   | tipo   |
                | Banco   | select |
                | Agência | input  |
                | Conta   | input  |
                | Dígito  | input  |
            Exemplos:
                | icone         | mensagem                                                 |
                | {icone-aviso} | "A conta informada deve pertencer ao titular do seguro." |

        Esquema do Cenário:CT15 - Valido formulário "Contato"
            Quando o usuário está na tela Informações
            Então abaixo do formulário "Dados bancários" deverá existir o formulário com título "Contato" e subtítulo "Vamos utilizar estes canais para te atualizar sobre o sinistro." contendo os campos <campo> do tipo <tipo>
            E ao digitar alguma informação nos campos do tipo textbox deverá s er habilidado no campo o botão {limpar}
            Exemplos:
                | campo    | tipo  |
                | E-mail   | input |
                | Telefone | input |

        Cenário:CT16 - Valido campos obrigatórios
            Dado que o usuário não preenche algum dos campos na tela "Informações"
            Então o campo não preenchido deverá assumir a cor vermelha
            E deverá ser exibido o {icone-aviso} à esquerda do botão {x}
            E abaixo do campo deverá ser exibida a mensagem "Campo obrigatório"

        Cenário:CT17 - Valido botão "Voltar" na tela de Informações
            Dado que o usuário está na tela de informações
            Quando clica no botão "Voltar"
            Então deverá retornar à tela "Data e local da ocorrência"
            
        Cenário:CT18 - Valido tela "Confirmação"
            Dado que o usuário preencheu os dados da tela "Informações"
            Quando clica no botão "Continuar"
            Então será exibida a tela de confirmação com o título "Confirmação da solicitação" e subtítulo "Confira as informações da sua solicitação antes de confirmar"
            E abaixo do subtítulo deverá existir o formulário preenchido com todos os dados informados nas telas "Data e local da ocorrência", "Informações"
            E abaixo do formulário deverão existir os botões  "Confirmar e solicitar sinistro", "Voltar"

        Cenário:CT19 - Valido botão "Voltar" na tela de Confirmação
            Dado que o usuário está na tela de Confirmação da solicitação
            Quando clica no botão "Voltar"
            Então deverá retornar à tela de "Informações" com os dados preenchidos

        Cenário:CT20 - Valido tela de sucesso na abertura do sinistro
            Dado que foi exibida a tela de Confirmação da solicitação preenchida
            Quando o usuário clica no botão "Confirmar e solicitar sinistro"
            Então será exibida a tela de sucesso na abertura do sinistro com o título "Solicitação aberta do sinistro n° {sinistro-numero}" e subtítulo "Você pode acompanhar o status através da tela de acompanhamento."
            E acima do título deverá existir o ícone {icone-sucesso}
            E abaixo do subtítulo deverá existir o formulário preenchido com todos os dados informados nas telas "Data e local da ocorrência", "Informações"
            E abaixo do formulário deverão existir os botões "Acompanhar solicitação", "Voltar ao início"

        Cenário:CT21 - Valido botão "Voltar ao início" na tela de sucesso na abertura do sinistro
            Dado que o usuário está na tela de sucesso na abertura do sinistro
            Quando clica no botão "Voltar ao início"
            Então deverá ser direcionado para a página inicial do Seguro residência

        Cenário:CT22 - Valido botão "Acompanhar solicitação" na tela de sucesso na abertura do sinistro
            Dado que o usuário está na tela de sucesso na abertura do sinistro
            Quando clica no botão "Acompanhar solicitação"
            Então deverá ser direcionado para o fluxo "meus-sinistros"
        
        Esquema do Cenário:CT23 - Valido mensagem de erro
            Quando ocorre falha ao carregar alguma das informações da página
            Então na área da falha deverão ser apresentadas as informações <icone>, <titulo>, <mensagem>, <botao>
            Exemplos:
                | icone         | titulo                                     | mensagem                      | botao            |
                | {icone-aviso} | "Não foi possível carregar as informações" | "Por favor, tente novamente." | Tentar novamente |