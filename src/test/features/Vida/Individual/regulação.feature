# language: pt
Funcionalidade: Regularização

  Contexto: Usuário Pessoa Física autenticado
    Dado que o usuário "Pessoa Física" esteja autenticado

	Cenário: Gerar código de boleto de parcela vencida
		Dado que possui o produto seguro vida individual
		E acionou o pagamento de parcela venciada
		E exibe interface de loading
		E exibe opções de datas para o vencimento
		E exibe o valor da parcela atualizado
		E exibe notificação que será disponibilizado apenas o código do boleto
		E exibe opção para continuar
		E continua
		E exibe número da parcela
		E exibe valor da parcela atualizado
		E exibe data de vencimento
		E exibe forma de pagamento
		E exibe opção para confirmar
		E exibe opção para voltar
		Quando confirma
		Então exibe loading
		E exibe código do boleto
