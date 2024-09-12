# language: pt
Funcionalidade: Validar funcionamento do modal Condições gerais do Seguro Residência

    Cenário:CT01 -Valido exibição do modal
        Dado que o usuário se autenticou no PDC
        E acessou o produto "Seguro Residência"
        Quando o usuário clica na opção "Condições gerais" disponível em "Menu > Apólices"
        Então deverá ser exibido um modal centralizado com o titulo "{icone-aviso}" contendo <h1>, <mensagem>, <botao1> <botao2>
        Exemplos:
            | h1                 | mensagem                 | botao1 | botao2         |
            | "Condições gerais" | {mensagem-transferencia} | Fechar | Ir para o site |

        Cenário:CT02 - Valido botão Fechar
            Dado que o usuário está no modal Condições gerais
            Quando clica no botão "Fechar"
            Então o modal deverá ser fechado mantendo o usuário no novo PDC

        Cenário:CT03 - Valido botão Ir para o site
            Dado que o usuário está no modal Condições gerais
            Quando clica no botão "Ir para o site"
            Então o usuário deverá ser direcionado para o antigo PDC
            
# {mensagem-transferencia}
# "Vamos te direcionar para o side da Porto onde você poderá acessar as condições gerais do seu seguro.\n\n
# Para acessar:
# Vá até o menu “Seguros” e selecione o seguro contratado;
# No final do site, encontre a seção de Condições gerais e clique no botão;
# Procure as condições gerais correspondentes à sua vigência."