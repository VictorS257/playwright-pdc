# language: pt
Funcionalidade: Meu corretor

  Contexto: Usuário Pessoa Física autenticado
    Dado que o usuário "Pessoa Física" esteja autenticado
    
	Cenário: Visualizar dados de contato do corretor sem produto
		Dado que possui o produto seguro vida individual
		Quando acessa os dados de contato do corretor
		Então exibe loading
		E exibe nome do corretor
		E exibe número de registro SUSEP
		E exibe telefone 
		E exibe e-mail
		
		Cenário: Visualizar dados de contato do corretor multiplos produtos
		Dado que possui o produto seguro vida individual
		Quando acessa os dados de contato do corretor
		Então exibe loading
		E exibe nome do corretor
		E exibe número de registro SUSEP
		E exibe telefone 
		E exibe e-mail
		E exibe produtos que o corretor é responsável
		
		Cenário: Visualizar dados de contato com mais de um corretor e multiplos produtos
		Dado que possui o produto seguro vida individual
		Quando acessa os dados de contato do corretor
		Então exibe loading
		E exibe nomes dos corretor
		E exibe número de registro SUSEP
		E exibe telefone 
		E exibe e-mail
		E exibe produtos que cada corretor é responsável
		
		Cenário: Timeout para visualizar dados de contato do corretor
		Dado que possui o produto seguro vida individual
		Quando acessa os dados de contato do corretor
		E falha
		Então exibe loading
		E exibe mensagem que não foi possível carregar as informações
		E exibe opção para tentar novamente
		
		Cenário: Indisponibilidade para visualizar dados de contato do corretor
		Dado que possui o produto seguro vida individual
		Quando acessa os dados de contato do corretor
		E está indisponível
		Então exibe loading
		E exibe mensagem que o sistema está indisponível no momento
		E exibe opção para voltar ao início