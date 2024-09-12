#language: pt
Funcionalidade: Pagamento

  Contexto: Usuário Pessoa Física autenticado
    Dado que o usuário "Pessoa Física" esteja autenticado

	Cenário: Gerar código de pagamento via PIX
		Dado que acessou a parcela
		E o método de pagamento é PIX
		Quando clica em pagar
		Então então exibe o código de pagamento via PIX
		E exibe o valor da parcela
		E exibe o vencimento da parcela
		E exibe opção para copiar o código
		E opção gerar QR code para pagamento via PIX
		E exibe texto de instrução do beneficiário para "Porto Seguro Cia de Segurios Gerais - CNPJ 61.198.164/0001-60"

	Cenário: Gerar QR code de pagamento via PIX
		Dado que acessou a parcela
		E o método de pagamento é PIX
		Quando clica em pagar
		E gera o QR Code
		Então então exibe o QR code de pagamento via PIX
		E exibe opção para copiar o código
		E exibe o valor da parcela
		E exibe o vencimento
		E exibe texto de instrução do beneficiário para "Porto Seguro Cia de Segurios Gerais - CNPJ 61.198.164/0001-60"

	Cenário: Gerar código do boleto para pagamento
		Dado que acessou a parcela
		E o método de pagamento é boleto
		Quando clica em pagar
		Então exibe o código do boleto
		E exibe o valor da parcela
		E exibe o vencimento da parcela
		E exibe opção para copiar o código
		E opção fazer download do boleto
		E exibe texto de instrução do beneficiário para "Porto Seguro Cia de Segurios Gerais - CNPJ 61.198.164/0001-60"

	Cenário: Fazer download do boleto para pagamento
		Dado que acessou a parcela
		E o método de pagamento é Boleto
		Quando clica em pagar
		E escolhe para fazer download do boleto
		Então faz download arquivo do boleto

	Cenário: Falha ao gerar código PIX
		Dado que acessou a parcela
		E o método de pagamento é PIX
		Quando clica em pagar
		E há falha para gerar o código PIX
		Então exibe a mensagem que não foi possível carregar as informações
		E exibe a opção de Tentar novamente

	Cenário: Falha ao gerar boleto
		Dado que acessou a parcela
		E o método de pagamento é Boleto
		Quando clica em pagar
		E há falha para gerar o boleto
		Então exibe a mensagem que não foi possível carregar as informações
		E exibe a opção de Tentar novamente

	Cenário: Falha ao copiar código do boleto
		Dado que acessou a parcela
		E o método de pagamento é Boleto
		E clica em pagar
		Quando falha para copiar o código do boleto
		Então exibe notificação de falha ao copiar

	Cenário: Falha ao copiar código do PIX
		Dado que acessou a parcela
		E o método de pagamento é PIX
		E clica em pagar
		Quando falha para copiar o código do PIX
		Então exibe notificação de falha ao copiar
