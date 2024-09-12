# language: pt
Funcionalidade: Gestão de menus

  Contexto:
    Dado que estou logado

	@smoke
	Cenário: Cadastrar menus
		Dado que estou na listagem de menus
		Quando cadastro um menu com nome do produto e nome de exibição
		Então exibe a notificação de sucesso
		E retorna para listagem de menus

	@smoke
	Cenário: Cadastrar submenus
		Dado que estou na listagem de menus
		E no formulário de cadastro de menus
		Quando habilito submenus
		E informando o o nome de exibição
		E link da URL
		Então exibe a notificação de sucesso
		E retorna para listagem de menus

	@smoke
	Esquema do Cenário: Editar menus
		Dado que estou na listagem de menus
		E há ao menos um menu cadastrado
		Quando altero a <propriedade> do menu com o <valor>
		Então exibe a notificação de sucesso
		E retorna para listagem de menus
		E <propriedade> do menu contém o <valor>
		Exemplos:
			| propriedade   | valor                              |
			| status        | Inativo                            |
			| nome_exibicao | Auto                               |
			| link          | https://www.portoseguro.com.br/pdc |

	Cenário: Excluir menu
		Dado que estou na listagem de menus
		E há ao menos um menu cadastrado
		Quando excluo o menu
		Então um popup é exibido alertando que a operação não poderá ser revertida
		E exibe a notificação de exclusão realizada com sucesso
		E o menu excluído não exibe na listagem

	Cenário: Busca menus da listagem
		Dado que estou na listagem de menus
		E há ao menos dois menus cadastrado
		Quando aplico a busca
		Então a listagem só exibe os menus com o nome de exibição pesquisado

	Cenário: limpa filtro da listagem
		Dado que estou na listagem de menus
		E e há um filtro aplicado
		Quando aplico o limpar filtro
		Então exibe todos os menus

	Cenário: Validação de dados obrigatórios
		Dados que estou no formulário de cadastro de novo menu
		Quando tento cadastrar o menu sem todos os dados
		Então o menu não é criado

	Cenário: Abortar cadastro de menu
		Dado que estou no formulário de cadastro de menu
		Quando cancelo o cadastro
		Então o menu não é criado

	Cenário: Exibir tela de carregamento
		Dado que estou no formulário de cadastro de menu
		Quando quando carrego a listagem de menus
		Então exibe a tela de carregamento

	Cenário: configurar quantidade de exibição de registros
		Dado que estou na listagem de menus
		Quando quando altero a quantidade de registros
		Então exibe no máximo o valor definido
