# language: pt
Funcionalidade: Visualizar coberturas contratadas

  Contexto: Usuário Pessoa Física autenticado
    Dado que o usuário "Pessoa Física" esteja autenticado
    
	Cenário: Exibir loading carregamento dados das coberturas contratadas
		Dado que possui o produto seguro vida individual
		Quando acessa cobertura contratadas
		Então exibe loading
		
		Cenário: Exibir coberturas contratadas
		Dado que possui o produto seguro vida individual
		Quando acessa cobertura contratadas
		Então exibe loading
		E exibe coberturas contratadas
		E exibe opção para ver detalhes de cada cobertura
		
		Cenário: Exibir loading carregamento dados das coberturas contratadas
		Dado que possui o produto seguro vida individual
		E acessou cobertura contratadas
		Quando acessa os detalhes da cobertura
		Então exibe detalhes da cobertura
		
		Cenário: Falha ao exibir dados das coberturas contratadas
		Dado que possui o produto seguro vida individual
		Quando acessa cobertura contratadas
		E falha
		Então exibe mensagem informando que o sistema está indisponível
		E exibe opção para voltar ao início