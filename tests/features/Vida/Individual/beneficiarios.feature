# language: pt
Funcionalidade: Beneficiários

  Contexto: Usuário Pessoa Física autenticado
    Dado que o usuário "Pessoa Física" esteja autenticado

	Cenário: Exibir loading carregamento dados dos beneficiários
		Dado que possui o produto seguro vida individual
		Quando acessa beneficiários
		Então exibe loading

	Cenário: Visualizar beneficiários ativos
		Dado que possui o produto seguro vida individual
		Quando acessa beneficiários
		Então exibe loading
		E exibe nome do beneficiário
		E exibe CPF do beneficiário
		E exibe parentesco
		E exibe participação
		E exibe opção para editar os beneficiários
		E exibe nome do segurado
		E exibe CPF do segurado
		E exibe data da vigência
		E exibe número da apólice

	Cenário: Visualizar beneficiários excluídos
		Dado que possui o produto seguro vida individual
		E beneficiário excluído
		Quando acessa beneficiários excluídos
		Então exibe loading
		E exibe nome do beneficiário
		E exibe CPF do beneficiário
		E exibe parentesco
		E exibe opção para editar os beneficiários
		E exibe nome do segurado
		E exibe CPF do segurado
		E exibe data da vigência
		E exibe número da apólice

	Cenário: Visualizar beneficiários com mais de um beneficiário ativos
		Dado que possui o produto seguro vida individual
		E há mais de um beneficiário ativo
		Quando acessa beneficiários
		Então todos os beneficiários ativos
		E soma das participações é igual a 100%

	Cenário: Editar beneficiário
		Dado que possui o produto seguro vida individual
		Quando acessa beneficiários
		E acessa edição do beneficiário
		E exibe loading
		Então exibe formulário
		E exibe campo para "nome"
		E exibe campo para "CPF"
		E exibe campo para "data de nascimento"
		E exibe combobox para "sexo"
		E exibe combobox para "parentesco"
		E exibe campo para "esclarecimento"
		E opção para salvar

	Cenário: Editar participação
		Dado que possui o produto seguro vida individual
		E possui mais de um beneficiário
		E acessa beneficiários
		E acessa edição da participação
		E exibe loading
		E exibe o valor percentual da participação de cada beneficiário
		E exibe opção para editar o valor da participação para cada beneficiário
		E exibe valor total configurado
		Quando altera o valor de participação
		E o valor total é igual a 100%
		Então exibe notificação de sucesso

	Cenário: Validação configuracão da participação
		Dado que possui o produto seguro vida individual
		E possui mais de um beneficiário
		E acessa beneficiários
		E acessa edição da participação
		E exibe loading
		E exibe o valor percentual da participação de cada beneficiário
		E exibe opção para editar o valor da participação para cada beneficiário
		E exibe valor total configurado
		Quando altera o valor de participação
		E o valor total é diferente de 100%
		Então exibe alerta indicando que a soma das participações precisa ser 100%

	Cenário: Adicionar beneficiário
		Dado que possui o produto seguro vida individual
		E possui mais de um beneficiário
		E acessa beneficiários
		E acessa edição da participação
		E exibe loading
		E exibe o valor percentual da participação de cada beneficiário
		E exibe opção para editar o valor da participação para cada beneficiário
		E exibe valor total configurado
		Quando adiciona um beneficiário
		Então exibe a notificação de sucesso
		E exibe alerta indicando que a soma das participações precisa ser 100%
		E o beneficiário adicionado é listado nos beneficiários

	Esquema do Cenário: Validar campos obrigatórios
		Dado que possui o produto seguro vida individual
		E e acessou o formulário de adicionar beneficiário
		E não preenche o campo <campo>
		Quando salva
		Então exibe notificação para preencher o campo <campo>
		Exemplos:
			| campo           |
			| nome            |
			| cpf             |
			| data_nascimento |
			| sexo            |
			| parentesco      |
			| esclarecimento  |

	Cenário: Remover beneficiário
		Dado que possui o produto seguro vida individual
		E possui mais de um beneficiário
		E acessa beneficiários
		E acessa edição da participação
		E exibe loading
		E exibe o valor percentual da participação de cada beneficiário
		E exibe opção para editar o valor da participação para cada beneficiário
		E exibe valor total configurado
		Quando exclui um beneficiário
		E confirma a exclusão
		Então exibe a notificação de sucesso
		E exibe alerta indicando que a soma das participações precisa ser 100%
		E o beneficiário excluído não é listado nos beneficiários

	Cenário: Falha ao listar beneficiários
		Dado que possui o produto seguro vida individual
		Quando acessa beneficiários
		E falha
		Então exibe loading
		E exibe mensagem notificando indisponibilidade do sistema
		E exibe opção para retornar ao início

	Cenário: Falha ao adicionar beneficiário
		Dado que possui o produto seguro vida individual
		E possui mais de um beneficiário
		E acessa beneficiários
		E acessa edição da participação
		E exibe loading
		E exibe o valor percentual da participação de cada beneficiário
		E exibe opção para editar o valor da participação para cada beneficiário
		E exibe valor total configurado
		Quando adiciona um beneficiário
		E falha
		Então exibe a notificação de falha
