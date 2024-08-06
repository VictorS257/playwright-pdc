# language: pt
Funcionalidade: Validar funcionamento da funcionalidade de pagamento de parcela do Seguro Auto-Itaú

    Contexto: Acesso a área financeira
        Dado que o usuário se autenticou no PDC
        E possui parcela vinculada à apólice
        E acessou o produto "Seguro Auto-Itaú"
        E clicou no botão "Exibir parcelas" na página inicial

        Cenário:CT01 - Valido loading
            Quando o sistema está recebendo as informações do modal
            Então os componentes abaixo do título do modal deverão estar em estado de carregamento

        Esquema do Cenário:CT02 - Valido modal de seleção de meio de pagamento
            Dado que o usuário clicou no botão "Pagar parcela" em alguma das parcelas em aberto
            E o sistema recebeu as informações do modal
            Então o título do modal deverá ser "Parcela {parcela-numero} de {total-parcelas}"
            E abaixo do título deverão existir os <campos> com os <dados>
            E abaixo dos campos deverá existir o botão do tipo select com as opções "Pix", "Boleto"
            E a opção "Pix" deverá estar selecionada
            E abaixo do botão select deverá existir o botão "Pagar"
            E abaixo do botão "Pagar" deverá existir o dialog contendo <icone>, <mensagem>
            E abaixo do dialog deverá existir a mensagem "Pague via Pix para a nova parcela ser liberada em instantes. Por boleto, a liberação leva até 2 dias."
            E na parte superior direita do componente deverá existir o botão {x} que irá fechar o modal
            Exemplos:
                | campos           | dados                |
                | Valor da parcela | {parcela-valor}      |
                | Vencimento       | {parcela-vencimento} |
            Exemplos:
                | icone       | mensagem                                           |
                | ìcone-aviso | "O código Pix é válido apenas para o dia de hoje." |

        Cenário:CT03 - Valido seleção da opção "Boleto"
            Dado que foi exibido o modal de seleção de meio de pagamento
            Quando o usuário seleciona a opção "Boleto" no botão do tipo select
            Então deverá ser habilitado o estado de loading no botão "Pagar"
            E o componente dialog deverá ser ocultado após conclusão do loading

        Esquema do Cenário:CT04 - Valido modal de pagamento via boleto
            Dado o usuário seleciona a opção "Boleto" no botão do tipo select
            Quando clica no botão "Pagar"
            Então abaixo do título do modal deverá existir a mensagem "Utilize o código de barras para o pagamento:\n{codigo-boleto}"
            E abaixo da mensagem deverão existir os <campos> com os <dados>
            E abaixo dos campos deverão existir os botões "Baixar boleto", "Copiar código de barras"
            E abaixo dos botões deveá existir a mensagem "Atenção: Após pagar o boleto, o prazo para sua compensação é de até 3 dias úteis.\nAntes de concluir o pagamento, confira nos canais bancários se o beneficiário está como Porto Seguro Cia de Seguros Gerais - CNPJ 61.198.164/0001-60"
            E na parte superior esquerda do componente deverá existir o botão {voltar} que irá retornar ao modal de seleção de meio de pagamento
            E na parte superior direita do componente deverá existir o botão {x} que irá fechar o modal
            Exemplos:
                | campos           | dados                |
                | Valor da parcela | {parcela-valor}      |
                | Vencimento       | {parcela-vencimento} |

        Cenário:CT05 - Valido botão "Baixar boleto"
            Dado o usuário seleciona a opção "Boleto" no botão do tipo select
            E clica no botão "Pagar"
            Quando clica no botão "Baixar boleto"
            Então o dispositivo deverá abrir a visualização do documento {boleto.pdf}

        Esquema do Cenário:CT06 - Valido botão "Copiar código de barras"
            Dado o usuário seleciona a opção "Boleto" no botão do tipo select
            E clica no botão "Pagar"
            Quando clica no botão "Copiar código de barras"
            Então deverá ser apresentado o componente dialog contendo <icone>, <mensagem>, <botao>
            E o componente deverá ser fechado automaticamente após "2s"
            Exemplos:
                | icone           | mensagem                     | botao |
                | {icone-sucesso} | "Certo, código copiado."     | {X}   |

        Esquema do Cenário:CT07 - Valido mensagem de erro ao copiar código de barras
            Dado o usuário seleciona a opção "Boleto" no botão do tipo select
            E clica no botão "Pagar"
            E clica no botão "Copiar código de barras"
            Quando ocorre falha ao copiar o código do boleto
            Então deverá ser apresentado o componente dialog contendo <icone>, <mensagem>, <botao>
            E o componente deverá ser fechado automaticamente após "2s"
            Exemplos:
                | icone           | mensagem                                                            | botao |
                | {icone-sucesso} | "Poxa, não foi possível copiar o código. Tente de novo mais tarde." | {X}   |

        Esquema do Cenário:CT08 - Valido pagamento via pix 
            Dado o usuário seleciona a opção "Pix" no botão do tipo select
            Quando clica no botão "Pagar"
            Então abaixo do título do modal deverá existir a mensagem "Copie o código, abra o aplicativo do seu banco, acesse a área Pix e cole o código para pagar:\n{chave-pix}"
            E abaixo da mensagem deverão existir os <campos> com os <dados>
            E abaixo dos campos deverão existir os botões "Gerar QR Code", "Copiar código Pix"
            E abaixo dos botões deveá existir a mensagem "Antes de concluir o pagamento, confira nos canais bancários se o beneficiário está como Porto Seguro Cia de Seguros Gerais - CNPJ 61.198.164/0001-60"
            E na parte superior esquerda do componente deverá existir o botão {voltar} que irá retornar ao modal de seleção de meio de pagamento
            E na parte superior direita do componente deverá existir o botão {x} que irá fechar o modal
            Exemplos:
                | campos           | dados                |
                | Valor da parcela | {parcela-valor}      |
                | Vencimento       | {parcela-vencimento} |

        Cenário:CT09 - Valido botão "Gerar QR Code"
            Dado o usuário seleciona a opção "Pix" no botão do tipo select
            E clica no botão "Pagar"
            Quando clica no botão "Gerar QR Code"
            Então deverá ser habilitado o estado de loading no botão "Gerar QR Code"
            E após o loading deverá ser exibido o QRcode abaixo da {chave-pix}
            E o botão "Gerar QR Code" deverá ser ocultado

        Esquema do Cenário:CT10 - Valido erro ao gerar QR code
            Dado o usuário clica no botão "Gerar QR Code"
            Quando ocorre falha ao gerar o QR code
            Então abaixo da {chave-pix} devera existir o dialog contendo <icone>, <titulo>, <mensagem>, <botao>
            Exemplos:
                | icone         | titulo                              | mensagem                                                                                          | botao            |
                | {icone-aviso} | "Não foi possível exibir o QR Code" | "Estamos trabalhando para voltar a exibi-lo o quanto antes. Tente de novo ou retorne mais tarde." | Tentar novamente |
        
        Esquema do Cenário:CT11 - Valido botão "Copiar código Pix"
            Dado o usuário seleciona a opção "Pix" no botão do tipo select
            E clica no botão "Pagar"
            Quando o usuário clica no botão "Copiar código Pix"
            Então deverá ser apresentado o componente dialog contendo <icone>, <mensagem>, <botao>
            E o componente deverá ser fechado automaticamente após "2s"
            Exemplos:
                | icone           | mensagem                     | botao |
                | {icone-sucesso} | "Certo, código copiado."     | {X}   |

        Esquema do Cenário:CT12 - Valido mensagem de erro ao copiar o código pix
            Dado o usuário seleciona a opção "Pix" no botão do tipo select
            E clica no botão "Pagar"
            E clica no botão "Copiar código Pix"
            Quando ocorre falha ao copiar o código pix
            Então deverá ser apresentado o componente dialog contendo <icone>, <mensagem>, <botao>
            E o componente deverá ser fechado automaticamente após "2s"
            Exemplos:
                | icone           | mensagem                                                            | botao |
                | {icone-sucesso} | "Poxa, não foi possível copiar o código. Tente de novo mais tarde." | {X}   |

        Esquema do Cenário:CT13 - Valido renegociação 
            Quando o usuário clica no botão "Pagar parcela" em alguma parcela vencida
            Então abaixo do título do modal deverá existir a mensagem "Escolha uma nova data de vencimento"
            E abaixo da mensagem deverá existir o scroll horizontal com as datas disponíveis
            E deverá existir o botão "Outras datas" que irá abrir o calendário
            E abaixo das datas deverá existir a mensagem "Valor da parcela atualizado {valor-atualizado}"
            E abaixo da mensagem deverá existir o coponente dialog contendo <icone>, <mensagem>
            E abaixo do dialog deverá existir o botão "Continuar"
            Exemplos:
                | icone         | mensagem                                                    |
                | {icone-aviso} | "A forma de pagamento dessa parcela será código de barras." |

        Esquema do Cenário:CT14 - Valido tela de confirmação da renegociação
            Dado que o usuário selecionou uma das datas disponíveis na renegociação
            Quando clica no botão "Continuar"
            Então abaixo do título do modal deverá existir a mensagem "Confirme os dados antes de continuar"
            E abaixo da mensagem deverão existir os <campos> com os <dados>
            E abaixo dos dados deverão existir os botões "Confirmar", "Voltar"
            E na parte superior esquerda do componente deverá existir o botão {voltar} que irá retornar ao modal de renegociação
            E na parte superior direita do componente deverá existir o botão {x} que irá fechar o modal
            Exemplos:
                | campos                      | dados              |
                | Valor da parcela atualizado | {valor-atualizado} |
                | Nova data de vencimento     | {data-vencimento}  |
                | Forma de pagamento          | "Boleto"           |

        Esquema do Cenário:CT15 - Valido confirmação da renegociação
            Dado que o usuário está na tela de confirmação da renegociação
            Quando clica no botão "Confirmar"
            Então abaixo do título do modal deverá existir a mensagem "Utilize o código de barras para o pagamento:\n{codigo-boleto}"
            E abaixo da mensagem deverão existir os <campos> com os <dados>
            E abaixo dos campos deverão existir os botões "Baixar boleto", "Copiar código de barras"
            E abaixo dos botões deveá existir a mensagem "Atenção: Após pagar o boleto, o prazo para sua compensação é de até 3 dias úteis.\nAntes de concluir o pagamento, confira nos canais bancários se o beneficiário está como Porto Seguro Cia de Seguros Gerais - CNPJ 61.198.164/0001-60"
            E na parte superior esquerda do componente deverá existir o botão {voltar} que irá retornar ao modal de confirmação de renegociação
            E na parte superior direita do componente deverá existir o botão {x} que irá fechar o modal
            Exemplos:
                | campos           | dados                |
                | Valor da parcela | {parcela-valor}      |
                | Vencimento       | {parcela-vencimento} |

        Esquema do Cenário:CT16 - Valido mensagem de erro timeout
            Quando ocorre falha ao receber alguma das informações dos modais
            Então a área do modal deve conter <icone>, <titulo>, <mensagem>, <botao>
            Exemplos:
                | icone           | titulo                                     | mensagem                   | botao            |
                | {aviso-circulo} | "Não foi possível carregar as informações" | Por favor tente novamente. | Tentar novamente |

        Esquema do Cenário:CT17 - Valido mensagem de erro sistema indisponível
            Quando ocorre falha na conexão com o servidor
            Então a área do modal deve conter <icone>, <titulo>, <mensagem>, <botao>
            Exemplos:
                | icone             | titulo                                       | mensagem                                                                                                | botao                |
                | {aviso-triangulo} | "Nosso sistema está indisponível no momento" | "Estamos trabalhando para que volte a funcionar o quanto antes. Por favor, tente novamente mais tarde." | Voltar para o início |
        