# language: pt
Funcionalidade: Validar funcionamento da opção Ver Apólice do Seguro Auto-Itaú

    Contexto:Acesso a funcionalidade Ver Apólice
        Dado que o usuário se autenticou no PDC
        E acessou o produto "Seguro Auto-Itaú"
        E clicou no botão "Baixar Apólice" disponível no menu de Ações rápidas

        Esquema do Cenário:CT01 - Valido mensagem do helper dialog
            Quando o sistema gera o documento {apolice.pdf}
            Então deverá ser exibido o componente dialog contendo <icone>, <titulo>, <mensagem>, <botao>
            Exemplos:
                | icone           | titulo                   | mensagem                                                             | botao   |
                | {aviso-circulo} | "Para abrir sua apólice" | "É só digitar os 4 primeiros dígitos do CPF do segurado da apólice." | Entendi |
                  
        # Esquema do Cenário:CT02 - Valido mensagem de erro
        #     Quando ocorre falha ao gerar o documento {apolice.pdf}
        #     Então deverá ser exibido o componente dialog contendo <icone>, <titulo>, <mensagem>, <botao>
        #     Exemplos:
        #         | icone   | titulo                                     | mensagem                     | botao            |
        #         | {aviso} | "Não foi possível carregar as informações" | "Por favor tente novamente." | Tentar novamente |

        Cenário:CT03 - Valido download da apólice
            Quando o usuário clica no botão "Entendi" do helper dialog "Ver apólice"
            Então o dispositivo deverá abrir a visualização do documento {apolice.pdf}
            E o documento deve estar protegido por senha
            E a senha do documento deverá ser composta pelos 4 primeiros digitos do CPF do segurado
