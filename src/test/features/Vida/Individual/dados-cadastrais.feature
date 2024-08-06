# language: pt
Funcionalidade: Dados cadastrais

  Contexto: Usuário Pessoa Física autenticado
    Dado que o usuário "Pessoa Física" esteja autenticado

	Cenário: Visualizar dados pessoais cadastrados
		Dado que possui o produto seguro vida individual
		Quando acessa os dados cadastrais
		Então exibe formulário dos dados pessoais com campos preenchidos
		E exibe número da apólice
		E exibe nome do segurado
		E exibe opção para cancelar
		E exibe opção para salvar alterações
		E exibe opção para voltar

	Esquema do Cenário: Alterar dados cadastrais
		Dado acessou formulário de dados cadastrais
		E altera o campo <campo>
		Quando salva
		Então exibe notificação de sucesso
		Exemplos:
			| campo            |
			| email            |
			| telefone         |
			| data_nascimento  |
			| numero_documento |
			| orgao_emissor    |
			| data_emissao     |
			| renda_mensal     |

	Esquema do Cenário: Falha ao alterar dados cadastrais
		Dado acessou formulário de dados cadastrais
		E altera o campo <campo>
		Quando salva
		E falha
		Então exibe notificação de falha no cadastro
		Exemplos:
			| campo |
			| email |

	Esquema do Cenário: Validação dos dados obrigatórios
		Dado acessou formulário de dados cadastrais
		E o campo <campo> não foi informado
		Quando salva
		Então exibe alerta de campo obrigatório
		Exemplos:
			| campo            |
			| email            |
			| telefone         |
			| data_nascimento  |
			| numero_documento |
			| orgao_emissor    |
			| data_emissao     |
			| renda_mensal     |

	Esquema do Cenário: Validação dos dados inválidos
		Dado acessou formulário de dados cadastrais
		Quando quando salva o campo <campo> com valor inválido
		Então exibe alerta que o dado está inválido
		Exemplos:
			| campo            |
			| email            |
			| telefone         |
			| data_nascimento  |
			| numero_documento |
			| orgao_emissor    |
			| data_emissao     |
