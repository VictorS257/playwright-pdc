# language: pt
Funcionalidade: Gestão de produtos

  Contexto:
    Dado que estou logado

	@smoke
	Cenário: Cadastrar produto
		Dado que estou na listagem de produtos
		Quando digito nome do produto, nome de exibição, abreviação
		E defino a prioridade
		E seleciono o perfil
		E seleciono o produto pai
		E seleciono o produto filho
		E marco a situação
		E defino os papeis
		E adiciono o atalho
		E seleciono o menu
		E seleciono vertical
		E envio imagem para ícone no formato svg
		Então exibe a notificação de sucesso
		E retorna para listagem de produtos

	@smoke
	Esquema do Cenário: Editar produto
		Dado que estou na listagem de produtos
		E há ao menos um produto cadastrado
		Quando altero a <propriedade> com o <valor>
		Então exibe a notificação de sucesso
		E retorna para listagem de produtos
		E <propriedade> contém o <valor>
		Exemplos:
			| propriedade   | valor   |
			| status        | Inativo |
			| nome_exibicao | Auto    |
			| perfil        | PJ      |

	Cenário: editar ordenação do atalho
		Dado que estou na edição de produto
		E há ao menos dois atalhos cadastrados
		Quando quando altero a ordenação atalho
		Então a ordem do atalho é alterada
		E exibe a notificação de edição realizada com sucesso

	Cenário: adicionar atalho
		Dado que estou na edição de produto
		Quando quando adiciono atalho
		E salvo as alterações
		Então então o atalho exibe nos atalhos vinculados ao produto
		E exibe a notificação de edição realizada com sucesso

	Cenário: remover atalho
		Dado que estou na edição de produto
		E há ao menos um atalho cadastrado
		Quando quando removo o atalho
		E salvo as alterações
		Então então o atalho não exibe nos atalhos vinculados ao produto
		E exibe a notificação de edição realizada com sucesso

	Cenário: Excluir produto
		Dado que estou na listagem de produtos
		E há ao menos um produto cadastrado
		Quando excluo o produto
		Então um popup é exibido alertando que a operação não poderá ser revertida
		E exibe a notificação de exclusão realizada com sucesso
		E o produto não exibe na listagem

	Cenário: busca produtos da listagem
		Dado que estou na listagem de produtos
		E há ao menos dois produto cadastrado
		Quando aplico a busca
		Então a listagem só exibe os produtos com o nome de exibição pesquisado

	Cenário: limpa filtro da listagem
		Dado que estou na listagem de produtos
		E e há um filtro aplicado
		Quando aplico o limpar filtro
		Então exibe todos produtos

	Cenário: Validação de dados obrigatórios
		Dado que estou no formulário de cadastro de novo produto
		Quando tento cadastrar o produto sem todos os dados
		Então o produto não é criado

	Cenário: Abortar cadastro de produto
		Dado que estou no formulário de cadastro de novo produto
		Quando cancelo o cadastro
		Então o produto não é criado

	Cenário: Exibir tela de carregamento
		Dado que estou no formulário de cadastro de novo produto
		Quando quando carrego a listagem de produtos
		Então exibe a tela de carregamento

	Cenário: configurar quantidade de exibição de registros
		Dado que estou na listagem de produtos
		Quando quando altero a quantidade de registros
		Então exibe no máximo o valor definido
