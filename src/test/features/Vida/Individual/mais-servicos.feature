# language: pt
Funcionalidade: Mais serviços

  Contexto: Usuário Pessoa Física autenticado
    Dado que o usuário "Pessoa Física" esteja autenticado
    
    Cenário: Acessar página de mais serviços
      Dado que possui o produto seguro vida individual
      Quando acessa "mais serviços"
      Então exibe link para acionar canal de atendimento pelo Whatsapp