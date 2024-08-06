# language: pt
Funcionalidade: Alterar forma de pagamento

  Contexto: Usuário Pessoa Física autenticado
    Dado que o usuário "Pessoa Física" esteja autenticado

	Cenário: Alterar forma de pagamento com uma apólice
		Dado que possui o produto seguro vida individual
		Quando acessa alterar forma de pagamento
		Então exibe loading
		E exibe dados da apólice
		E exibe indicação da forma de pagamento atual
		E exibe opções de formas de pagamento
		E exibe valor da próxima parcela
		E exibe o próximo vencimento

	Cenário: Alterar forma de pagamento com mais de uma apólice
		Dado que possui o produto seguro vida individual
		E possui mais de uma apólice
		Quando acessa alterar forma de pagamento
		Então exibe loading
		E exibe dados da apólice
		E exibe opção para alterar a apólice
		E exibe indicação da forma de pagamento atual
		E exibe opções de formas de pagamento
		E exibe valor da próxima parcela
		E exibe o próximo vencimento
		E exibe opção para cancelar
		E exibe opção para continuar

	Cenário: Alterar forma de pagamento para débito automático
		Dado acessou a alteração de forma de pagamento
		E a forma de pagamento atual é boleto
		E altera a forma de pagamento para "Débito Automático"
		E exibe formulário para cadastro dos dados bancários
		E continua cadastro
		E exibe resumo dos dados cadastrados
		E exibe opção para cancelar
		E exibe opção para confirmar
		Quando confirma o cadastro
		Então exibe loading
		E exibe mensagem de alteração realizada com sucesso
		E exibe opção para voltar ao início

	Cenário: Validação formulário para débito automático
		Dado acessou a alteração de forma de pagamento
		E a forma de pagamento atual é boleto
		E altera a forma de pagamento para "Débito Automático"
		E exibe formulário para cadastro dos dados bancários
		E há algum campo sem preenchimento
		Quando continua cadastro
		Então exibe notificação nos campos não preenchidos

	Cenário: Validação de CPF válido no formulário para débito automático
		Dado acessou a alteração de forma de pagamento
		E a forma de pagamento atual é boleto
		E altera a forma de pagamento para "Débito Automático"
		E exibe formulário para cadastro dos dados bancários
		E o os digitos do CPF é inválido
		Quando continua cadastro
		Então exibe notificação que os digitos do CPF é inválido

	Cenário: Falha ao alterar forma de pagamento para débito automático
		Dado acessou a alteração de forma de pagamento
		E a forma de pagamento atual é boleto
		E altera a forma de pagamento para "Débito Automático"
		E exibe formulário para cadastro dos dados bancários
		E continua cadastro
		E exibe resumo dos dados cadastrados
		E exibe opção para cancelar
		E exibe opção para confirmar
		Quando confirma o cadastro
		E falha
		Então exibe loading
		E exibe notificação de erro

	Cenário: Falha ao exibir formas de pagamentos
		Dado que possui o produto seguro vida individual
		Quando acessa alterar forma de pagamento
		E falha
		Então exibe loading
		E exibe mensagem que não foi possível carregar informações
		E exibe opção produto
		E quantidade de parcelas
