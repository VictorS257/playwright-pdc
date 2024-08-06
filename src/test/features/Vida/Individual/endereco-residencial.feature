#language: pt
Funcionalidade: Dados de endereço residencial

	Contexto: Usuário Pessoa Física autenticado
		Dado que o usuário "Pessoa Física" esteja autenticado

	Cenário: Visualizar dados do endereço residencial cadastrados
		Dado que possui o produto seguro vida individual
		Quando acessa os dados cadastrais
		E acessa endereço residencial
		Então exibe formulário do endereço residencial com campos preenchidos
		E exibe número da apólice
		E exibe nome do segurado
		E exibe opção para cancelar
		E exibe opção para salvar alterações
		E exibe opção para voltar

	Esquema do Cenário: Alterar dados endereço residencial
		Dado acessou formulário de dados do endereço "residencial"
		E altera o campo <campo>
		Quando salva
		Então exibe notificação de sucesso
		Exemplos:
			| campo                |
			| cep                  |
			| endereco             |
			| numero_endereco      |
			| complemento_endereco |
			| bairro               |
			| cidade               |
			| estado               |

	Esquema do Cenário: Falha ao alterar dados do endereço residencial
		Dado acessou formulário de dados do endereço "residencial"
		E altera o campo <campo>
		Quando salva
		E falha
		Então exibe notificação de falha no cadastro
			Exemplos:
			| campo    |
			| endereco |

	Esquema do Cenário: Validação dos dados obrigatórios
		Dado acessou formulário de dados do endereço "residencial"
		E o campo <campo> não foi informado
		Quando salva
		Então exibe alerta de campo obrigatório
		Exemplos:
			| campo                |
			| cep                  |
			| endereco             |
			| numero_endereco      |
			| complemento_endereco |
			| bairro               |
			| cidade               |
			| estado               |

	Esquema do Cenário: Validação dos dados inválidos
		Dado acessou formulário de dados do endereço "residencial"
		Quando quando salva o campo <campo> com valor inválido
		Então exibe alerta que o dado está inválido
		Exemplos:
			| campo                |
			| cep                  |
			| endereco             |
			| numero_endereco      |
			| complemento_endereco |
			| bairro               |
			| cidade               |
			| estado               |

	Esquema do Cenário: Alterar dados endereço comercial
		Dado acessou formulário de dados do endereço "comercial"
		E altera o campo <campo>
		Quando salva
		Então exibe notificação de sucesso
		Exemplos:
			| campo                |
			| cep                  |
			| endereco             |
			| numero_endereco      |
			| complemento_endereco |
			| bairro               |
			| cidade               |
			| estado               |

	Esquema do Cenário: Falha ao alterar dados do endereço comercial
		Dado acessou formulário de dados do endereço "comercial"
		E altera o campo <campo>
		Quando salva
		E falha
		Então exibe notificação de falha no cadastro
		Exemplos:
			| campo    |
			| endereco |

	Esquema do Cenário: Validação dos dados obrigatórios
		Dado acessou formulário de dados do endereço "comercial"
		E o campo <campo> não foi informado
		Quando salva
		Então exibe alerta de campo obrigatório
		Exemplos:
			| campo                |
			| cep                  |
			| endereco             |
			| numero_endereco      |
			| complemento_endereco |
			| bairro               |
			| cidade               |
			| estado               |

	Esquema do Cenário: Validação dos dados inválidos
		Dado acessou formulário de dados do endereço "comercial"
		Quando quando salva o campo <campo> com valor inválido
		Então exibe alerta que o dado está inválido
		Exemplos:
			| campo                |
			| cep                  |
			| endereco             |
			| numero_endereco      |
			| complemento_endereco |
			| bairro               |
			| cidade               |
			| estado               |

	Cenário: Buscar CEP
		Dado acessou formulário de dados do endereço "residencial"
		E informou um CEP válido
		Quando busca o CEP
		Então preenche os campos endereço, bairro, cidade e estado
