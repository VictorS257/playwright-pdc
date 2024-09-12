# language: pt
Funcionalidade: Gestão de verticais

  Contexto:
    Dado que estou logado

	@smoke
	Cenário: Cadastrar vertical
		Dado que estou na listagem de verticais
		Quando digito nome, nome de exibição
		E cadastro o link institucional
		E envio imagem para ícone no formato svg
		Então exibe a notificação de sucesso
		E retorna para listagem de verticais

	@smoke
	Esquema do Cenário: Editar vertical
		Dado que estou na listagem de verticais
		E há ao menos uma vertical cadastrada
		Quando altero a <propriedade> de verticais com o <valor>
		Então exibe a notificação de sucesso
		E retorna para listagem de verticais
		E <propriedade> de verticais contém o <valor>
		Exemplos:
			| propriedade   | valor       |
			| nome          | Vertical    |
			| nome_exibicao | Minha Porto |

	Cenário: Excluir vertical
		Dado que estou na listagem de verticais
		E há ao menos uma vertical cadastrada
		Quando excluo o a vertical
		Então um popup é exibido alertando que a operação não poderá ser revertida
		E exibe a notificação de exclusão realizada com sucesso
		E o vertical não exibe na listagem

	Cenário: Busca verticais na listagem
		Dado que estou na listagem de verticais
		E há ao menos duas verticais cadastradas
		Quando aplico a busca
		Então a listagem só exibe as verticais com o nome de exibição pesquisado

	Cenário: limpa filtro da listagem
		Dado que estou na listagem de verticais
		E e há um filtro aplicado
		Quando aplico o limpar filtro
		Então exibe todas verticais

	Cenário: Ordenação dos links institucionais
		Dado que estou na edição de verticais
		E há ao menos dois links institucionais cadastrados
		Quando quando altero a ordem do segundo para primeira posição
		E salvo as alterações
		Então o segundo link exibe na primeira posição

	Cenário: Validação de dados obrigatórios
		Dados que estou no formulário de cadastro de nova vertical
		Quando tento cadastrar a vertical sem todos os dados
		Então a vertical não é criada

	Cenário: Abortar cadastro de vertical
		Dado que estou no formulário de cadastro de nova vertical
		Quando cancelo o cadastro
		Então a vertical não é criada

	Cenário: Exibir tela de carregamento
		Dado que estou no formulário de cadastro de nova vertical
		Quando quando carrego a listagem de verticais
		Então exibe a tela de carregamento

	Cenário: configurar quantidade de exibição de registros
		Dado que estou na listagem de verticais
		Quando quando altero a quantidade de registros
		Então exibe no máximo o valor definido
