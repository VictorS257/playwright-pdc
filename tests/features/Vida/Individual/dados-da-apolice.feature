# language: pt
Funcionalidade: Dados da apólice

  Contexto: Usuário Pessoa Física autenticado
    Dado que o usuário "Pessoa Física" esteja autenticado

	Cenário: Exibir loading carregamento dados da apólice
		Dado que possui o produto seguro vida individual
		Quando acessa dados da apólice
		Então exibe loading

	Cenário: Exibir dados da apólice
		Dado que possui o produto seguro vida individual
		Quando acessa dados da apólice
		Então exibe loading
		E exibe nome completo
		E exibe número da apólice
		E exibe vigencia
		E exibe endosso
		E exibe sucursal
		E exibe proposta
		E exibe proposta
		E exibe data de emissão
		E exibe nome completo
		E exibe prêmio total
		E exibe forma de pagamento
		E exibe responsável financeiro
		E exibe nome do corretor
		E exibe link para ver contatos
		E exibe link para ver em PDF
		E exibe opção para ir para dados cadastrais
		E exibe opção para ir para questionário

	Cenário: Exibir dados da apólice cliente com mais de uma
		Dado que possui o produto seguro vida individual
		E possui mais de uma apólice
		Quando acessa dados da apólice
		Então exibe loading
		E exibe opção para alterar apólice
		E exibe nome completo
		E exibe número da apólice
		E exibe vigencia
		E exibe endosso
		E exibe sucursal
		E exibe proposta
		E exibe proposta
		E exibe data de emissão
		E exibe nome completo
		E exibe prêmio total
		E exibe forma de pagamento
		E exibe responsável financeiro
		E exibe nome do corretor
		E exibe link para ver contatos
		E exibe link para ver em PDF
		E exibe opção para ir para dados cadastrais
		E exibe opção para ir para questionário

	Cenário: Falha ao exibir dados da apólice
		Dado que possui o produto seguro vida individual
		Quando acessa dados da apólice
		Então exibe loading
		E exibe mensagem que não foi possível carregar as informações
		E exibe opção para tentar novamente
