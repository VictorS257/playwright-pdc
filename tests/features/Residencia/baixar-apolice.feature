# language: pt
Funcionalidade: Validar funcionamento da opção Ver apólice do Seguro Residência

    Contexto:Acesso a funcionalidade Ver apólice
        Dado que o usuário se autenticou no PDC
        E acessou o produto "Seguro Residência"
        E clicou no botão "Baixar apólice" disponível no menu de Ações rápidas

        Esquema do Cenário:CT01 - Valido mensagem do helper dialog
            Quando o sistema gera o documento {apolice.pdf}
            Então deverá ser exibido o componente dialog contendo <icone>, <titulo>, <mensagem>, <botao>
            Exemplos:
                | icone           | titulo               | mensagem                                                                     | botao     |
                | {aviso-circulo} | "Abra a sua apólice" | "Para isso, basta preencher os quatro primeiros números do CPF do segurado." | Continuar |
                  
        Esquema do Cenário:CT02 - Valido mensagem de erro
            Quando ocorre falha ao gerar o documento {apolice.pdf}
            Então deverá ser exibido o componente dialog contendo <icone>, <titulo>, <mensagem>, <botao>
            Exemplos:
                | icone   | titulo                                     | mensagem                                                                                              | botao            |
                | {aviso} | "Não foi possível carregar as informações" | "Estamos trabalhando para que volte a funcionar o quanto antes. Por favor, tente de novo mais tarde." | Tentar novamente |

        Cenário:CT03 - Valido download da apólice
            Quando o usuário clica no botão "Continuar" do helper dialog "Baixar apólice"
            Então o dispositivo deverá abrir a visualização do documento {apolice.pdf}
            E o documento deve estar protegido por senha
            E a senha do documento deverá ser composta pelos 4 primeiros digitos do CPF do segurado
