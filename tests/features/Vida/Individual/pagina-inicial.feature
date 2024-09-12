# language: pt
Funcionalidade: Página inicial seguro vida individual

  Contexto: Usuário Pessoa Física autenticado
    Dado que o usuário "Pessoa Física" esteja autenticado

	Cenário: Loading da página inicial do produto
		Dado que possui o produto seguro vida individual
		Quando acessa a página inicial do seguro vida individual
		Então exibe interface de loading

	Cenário: Menus
		Dado que possui o produto seguro vida individual
		Quando acessa a página inicial do seguro vida individual
		Então exibe a opção no menu "pagina inicial"
		E exibe a opção no menu "Parcelas"
		E exibe a opção no menu "Alterar forma de pagamento"
		E exibe a opção no menu "Apólices"
		E exibe a opção no menu "Endosso"

	Cenário: Submenus de Apólices
		Dado que possui o produto seguro vida individual
		Quando acessa o menu "Apólices"
		Então exibe a opção no submenu "Dados da apólice"
		E exibe a opção no submenu "Coberturas contratadas"

	Cenário: Submenus de Endosso
		Dado que possui o produto seguro vida individual
		Quando acessa o menu "Endosso"
		Então exibe a opção no submenu "Dados cadastrais"
		E exibe a opção no submenu "Beneficiário"

	Cenário: Atalhos
		Dado que possui o produto seguro vida individual
		Quando acessa a página inicial do seguro vida individual
		Então exibe a opção de atalho "Pagamentos"
		E exibe a opção de atalho "Dados da apólice"
		E exibe a opção de atalho "Mais serviços"
		E exibe a opção de atalho "Formas de pagamentos"
		E exibe a opção de atalho "Coberturas contratadas"

	Cenário: Visualizar dados da apólice
		Dado que acessou a página inicial do produto
		Quando os dados carregam
		Então exibe número da apólice
		E exibe valor da parcela
		E exibe nome completo
		E exibe nome do seguro
		E exibe vigencia
		E exibe vencimento da parcela
		E exibe quantidade de parcelas
		E exibe parcela atual

	Cenário: Visualizar dados da apólice
		Dado que acessou a página inicial do produto
		E possui mais de uma apólice
		Quando os dados carregam
		Então exibe ícones da apólice selecionado
		E exibe número da apólice
		E exibe valor da parcela
		E exibe nome completo
		E exibe nome do seguro
		E exibe vigencia
		E exibe vencimento da parcela
		E exibe quantidade de parcelas
		E exibe parcela atual

	Cenário: Ver apólice
		Dado que possui o produto seguro vida individual
		Quando acessa ver apólice
		Então exibe interface de loading da apólice
		E exibe os dados da apólice

	Cenário: Baixar apólice
		Dado que possui o produto seguro vida individual
		Quando baixa a apólice
		Então exibe instrução de como abrir a apólice
		E faz download do arquivo

	Cenário: Notificação de endosso
		Dado que possui o produto seguro vida individual
		E possui endosso
		Quando acessa a página inicial do seguro vida individual
		Então exibe a mensagem que existe pagamentos adicionais por alterações no seguro

	Cenário: Exibir parcela com até 3 dias fora do prazo de pagamento
		Dado que possui o produto seguro vida individual
		E possui parcela com atraso no pagamento de 3 dias
		Quando acessa a página inicial do seguro vida individual
		Então exibe a mensagem aguardando confirmação do pagamento

	Cenário: Exibir parcela com até 4 dias fora do prazo de pagamento
		Dado que possui o produto seguro vida individual
		E possui parcela com atraso no pagamento de 4 dias
		Quando acessa a página inicial do seguro vida individual
		Então exibe a mensagem que o pagamento está em atraso

	Cenário: Exibir notificação de mais de uma parcela em atraso de pagamento
		Dado que possui o produto seguro vida individual
		E possui mais de uma parcela em atraso de pagamento
		Quando acessa a página inicial do seguro vida individual
		Então exibe a mensagem que há mais de uma parcela em atraso de pagamento

	Cenário: Sem parcelas a pagar
		Dado que possui o produto seguro vida individual
		E todas as parcelas estão pagas
		Quando acessa a página inicial do seguro vida individual
		Então exibe a mensagem sem parcelas futuras
		E exibe que o produto está pago

	Cenário: Falha ao carregar dados do seguro de vida
		Dado que possui o produto seguro vida individual
		Quando acessa a página inicial do seguro vida individual
		E falha o carregamento dos dados das apólices
		Então exibe a mensagem Não foi possível carregar as informações
		E exibe opção para tentar novamente

	Cenário: Carregamento página de pagamentos
		Dado acessou a página inicial de seguro vida
		Quando acessa a página de pagamentos
		Então exibe loading da página de parcelas

	Cenário: Visualizar até 3 parcelas
		Dado acessou a página inicial de seguro vida
		Quando acessa a página de pagamentos
		Então exibe da parcela atual
		E exibe valor total das parcelas
		E exibe valor restante total das parcelas

	Cenário: Visualizar acima de 3 parcelas
		Dado acessou a página inicial de seguro vida
		Quando acessa a página de pagamentos
		Então exibe da parcela atual
		E exibe valor total das parcelas
		E exibe valor restante total das parcelas
		E exibe opção para ver todas as parcelas

	Cenário: Exibir parcela do mes atual paga
		Dado acessou a página inicial de seguro vida
		E a parcela do mês atual está paga
		Quando acessa a página de pagamentos
		Então exibe parcela do mês atual com status "paga"

	Cenário: Exibir parcela do mes atual pendente de pagamento no prazo com cartão porto
		Dado acessou a página inicial de seguro vida
		E a parcela do mês atual está pendente de pagamento
		E está no prazo
		Quando acessa a página de pagamentos
		Então exibe parcela do mês atual com status "a vencer"
		E exibe opção para consultar cartão
		E exibe a tag "cartão porto"

	Cenário: Exibir parcela do mes atual pendente de pagamento fora do prazo com cartão porto
		Dado acessou a página inicial de seguro vida
		E a parcela do mês atual está pendente de pagamento
		E está fora do prazo
		Quando acessa a página de pagamentos
		Então exibe parcela do mês atual com status "vencida"
		E exibe a tag "cartão porto"
		E exibe opção para pagar fatura

	Cenário: Detalhes da parcela
		Dado acessou a página inicial de seguro vida
		Quando quando acessa os detalhes da parcela
		Então exibe número da parcela
		E exibe quantidade de parcela
		E exibe vencimento
		E exibe status de pagamento
		E exibe forma de pagamento
		E exibe valor da parcela
		E exibe mensagem
		E exibe opção para pagar parcela

	Cenário: Falha ao carregar detalhes da parcela
		Dado acessou a página inicial de seguro vida
		Quando quando acessa os detalhes da parcela
		E falha o carregamento
		Então exibe a mensagem não foi possível carreegar as informações
		E opção para tentar novamente

	Cenário: Exibir parcela do mês atual pendente de pagamento no prazo com débito automático
		Dado acessou a página inicial de seguro vida
		E a forma de pagamento é débito automático
		E a parcela do mês atual está pendente de pagamento
		E está no prazo
		Quando acessa a página de pagamentos
		Então exibe parcela do mês atual com status "A vencer"
		E exibe opção para pagar parcela
		E exibe a tag "Débito automático"

	Cenário: Exibir parcela do mês atual vencida com débito automático
		Dado acessou a página inicial de seguro vida
		E a forma de pagamento é débito automático
		E a parcela do mês atual está pendente de pagamento
		E está fora do prazo
		Quando acessa a página de pagamentos
		Então exibe parcela do mês atual com status "vencida"
		E exibe a tag "débito automático"
		E exibe opção para pagar parcela
		E exibe a mensagem indicando que o pagamento por débito automático não foi realizado

	Cenário: Exibir parcela do mês atual paga no prazo com débito automático
		Dado acessou a página inicial de seguro vida
		E a forma de pagamento é débito automático
		E a parcela do mês atual está paga
		Quando acessa a página de pagamentos
		Então exibe parcela do mês atual com status "processando"
		E exibe a tag "débito automático"
		E exibe opção para pagar parcela
		E exibe a mensagem indicando que o pagamento está em processamento

	Cenário: Exibir parcela do mês atual pendente de pagamento no prazo com boleto
		Dado acessou a página inicial de seguro vida
		E a forma de pagamento é boleto
		E a parcela do mês atual está pendente de pagamento
		E está no prazo
		Quando acessa a página de pagamentos
		Então exibe parcela do mês atual com status "A vencer"
		E exibe opção para pagar parcela
		E exibe a tag "Boleto"

	Cenário: Exibir parcela do mês atual vencida com boleto
		Dado acessou a página inicial de seguro vida
		E a forma de pagamento é boleto
		E a parcela do mês atual está pendente de pagamento
		E está fora do prazo
		Quando acessa a página de pagamentos
		Então exibe parcela do mês atual com status "vencida"
		E exibe a tag "Boleto"
		E exibe opção para pagar parcela
		E exibe a mensagem indicando que o pagamento por débito automático não foi realizado

	Cenário: Exibir parcela do mês atual paga no prazo com boleto
		Dado acessou a página inicial de seguro vida
		E a forma de pagamento é boleto
		E a parcela do mês atual está paga
		Quando acessa a página de pagamentos
		Então exibe parcela do mês atual com status "processando"
		E exibe a tag "Boleto"
		E exibe opção para pagar parcela
		E exibe a mensagem indicando que o pagamento está em processamento

	Cenário: Exibir parcela do mês atual não paga no prazo com boleto
		Dado acessou a página inicial de seguro vida
		E a forma de pagamento é boleto
		E a parcela do mês atual não está paga
		Quando acessa a página de pagamentos
		Então exibe parcela do mês atual com status "a vencer"
		E exibe a tag "Boleto"
		E exibe opção para pagar parcela
		E exibe a mensagem indicando que o pagamento está em processamento

	Cenário: Exibir parcela do mês atual pendente de pagamento no prazo com cartão de crédito de outros emissores
		Dado acessou a página inicial de seguro vida
		E a forma de pagamento é cartão de crédito de outros emissores
		E a parcela do mês atual está pendente de pagamento
		E está no prazo
		Quando acessa a página de pagamentos
		Então exibe parcela do mês atual com status "A vencer"
		E exibe opção para pagar parcela
		E exibe a tag "Cartão"

	Cenário: Exibir parcela do mês atual vencida com cartão de crédito de outros emissores
		Dado acessou a página inicial de seguro vida
		E a forma de pagamento é boleto
		E a parcela do mês atual está pendente de pagamento
		E está fora do prazo
		Quando acessa a página de pagamentos
		Então exibe parcela do mês atual com status "vencida"
		E exibe a tag "Cartão"
		E exibe opção para pagar parcela
		E exibe a mensagem indicando que o pagamento por débito automático não foi realizado

	Cenário: Exibir parcela do mês atual paga no prazo com cartão de crédito de outros emissores
		Dado acessou a página inicial de seguro vida
		E a forma de pagamento é boleto
		E a parcela do mês atual está paga
		Quando acessa a página de pagamentos
		Então exibe parcela do mês atual com status "processando"
		E exibe a tag "Cartão"
		E exibe opção para pagar parcela
		E exibe a mensagem indicando que o pagamento está em processamento

	Cenário: Exibir parcela do mês atual não paga no prazo com cartão de crédito de outros emissores
		Dado acessou a página inicial de seguro vida
		E a forma de pagamento é boleto
		E a parcela do mês atual não está paga
		Quando acessa a página de pagamentos
		Então exibe parcela do mês atual com status "a vencer"
		E exibe a tag "Cartão"
		E exibe opção para pagar parcela
		E exibe a mensagem indicando que o pagamento está em processamento
