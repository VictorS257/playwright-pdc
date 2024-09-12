# language: pt
Funcionalidade: Validar funcionamento do modal Apoio jurídico do Seguro Auto-Azul

    Contexto:Acesso a funcionalidade Apoio jurídico
        Dado que o usuário se autenticou no PDC
        E acessou o produto "Seguro Auto-Azul"
        E clicou no link "Apoio jurídico" em "Menu > Assistências"

        Cenário:CT01 - Valido loading
            Quando o sistema está recebendo as informações do modal
            Então os componentes abaixo do título do modal deverão estar em estado de carregamento

        Esquema do Cenário:CT02 - Valido exibição das informações do modal
            Quando o sistema recebe as informações do modal
            Então o título do modal deverá ser "Apoio Jurídico"
            E abaixo do título deverá existir o subtítulo "Você foi acionado judicialmente por conta de um sinistro envolvendo o carro segurado?"
            E abaixo do subtítulo deverá existir a mensagem "Aconteceu um sinistro que está coberto na sua apólice (contrato) e um terceiro, envolvido na situação, está movendo uma ação judicial contra você? Conte com o atendimento especializado em dar orientações jurídicas da Porto!"
            E logo abaixo deverá existir a mensagem "Basta enviar a documentação da ação judicial para:\njuridico.atendimentosegurado@portoseguro.com.br"
            E abaixo da mensagem deverá existir o botão "Copiar endereço de e-mail"
            E na parte inferior do modal deverá existir o botão "Enviar documentos"
            E na parte superior direita do componente deverá existir o botão {x} que irá fechar o modal

        Esquema do Cenário:CT03 - Valido botão "Copiar endereço de e-mail"
            Quando o usuário clica no botão "Copiar endereço de e-mail"
            Então deverá ser apresentado o componente dialog contendo <icone>, <mensagem>, <botao>
            E o componente deverá ser fechado automaticamente após "2s"
            Exemplos:
                | icone           | mensagem                             | botao |
                | {icone-sucesso} | "Certo, endereço de e-mail copiado." | {X}   |
        
        Esquema do Cenário:CT04 - Valido mensagem de erro
            Quando ocorre falha ao receber as informações do modal
            Então a área do modal deve conter <icone>, <titulo>, <mensagem>, <botao>
            Exemplos:
                | icone           | titulo                                     | mensagem                   | botao            |
                | {aviso-circulo} | "Não foi possível carregar as informações" | Por favor tente novamente. | Tentar novamente |
