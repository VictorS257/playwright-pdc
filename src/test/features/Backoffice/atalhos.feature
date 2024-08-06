# language: pt
Funcionalidade: Gestão de atalhos

  Contexto:
    Dado que estou logado

	@smoke
	Cenário: Cadastrar atalho
		Dado que estou na listagem de atalhos
		Quando cadastro um atalho com nome e nome de exibição
		E defino os tipos de exibição
		E defino o peso do atalho
		E digito a URL
		E envio uma imagem de ícone no formato svg
		Então exibe a notificação de sucesso
		E retorna para listagem de atalhos

	@smoke
	Esquema do Cenário: Editar atalho
		Dado que estou na listagem de atalhos
		E há ao menos um atalho cadastrado
		Quando altero a <propriedade> do atalho com o <valor>
		Então exibe a notificação de sucesso
		E retorna para listagem de atalhos
		E <propriedade> do atalho contém o <valor>
		Exemplos:
			| propriedade   | valor                              |
			| status        | Inativo                            |
			| nome_exibicao | Auto                               |
			| link          | https://www.portoseguro.com.br/pdc |
			| tipo          | Home                               |
			| peso          |                                  1 |

	Cenário: Excluir atalho
		Dado que estou na listagem de atalho
		E há ao menos um atalho cadastrado
		Quando excluo o atalho
		Então um popup é exibido alertando que a operação não poderá ser revertida
		E exibe a notificação de exclusão realizada com sucesso
		E o atalho excluído não exibe na listagem

	Cenário: Busca atalho da listagem
		Dado que estou na listagem de atalhos
		E há ao menos dois atalhos cadastrados
		Quando aplico a busca
		Então a listagem só exibe os atalhos com o nome de exibição pesquisado

	Cenário: Validação de dados obrigatórios
		Dados que estou no formulário de cadastro de novo atalho
		Quando tento cadastrar o atalho sem todos os dados
		Então o atalho não é criado

	Cenário: Abortar cadastro de Atalho
		Dado que estou no formulário de cadastro de atalho
		Quando cancelo o cadastro
		Então o menu não é criado

	Cenário: Exibir tela de carregamento
		Dado que estou no formulário de cadastro de atalho
		Quando quando carrego a listagem de atalho
		Então exibe a tela de carregamento

	Cenário: configurar quantidade de exibição de registros
		Dado que estou na listagem de atalhos
		Quando quando altero a quantidade de registros
		Então exibe no máximo o valor definido
