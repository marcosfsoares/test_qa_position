#language: pt

Funcionalidade: Realizar o checkout e concluir a compra
    Sendo um cliente com os produtos escolhidos no carrinho
    Quero realizar o checkout 
    Para que eu possa finalizar a compra

    Contexto: 
        Dado que estou logado como "standard_user" e "secret_sauce"
            E filtro os produtos por preço crescente
            E os produtos são mostrados com preço em ordem crescente
            E adiciono os produtos "Sauce Labs Onesie" e "Test.allTheThings() T-Shirt (Red)" ao carrinho  
            E o ícone do carrinho mostra a quantidade adicionada
    
    @carrinho
    Cenario: Realizar o checkout
        
        E clico no ícone do carrinho
        Quando clico no botão checkout
        Então vou para a página de informações de entrega

    @entrega
    Cenario: Preencher o formulário de entrega e finalizar a compra

        E clico no ícone do carrinho
        E clico no botão checkout
        E vou para a página de informações de entrega
        Quando preencho o formulário com nome "Marcos", ultimo nome "Soares" e cep "09175360"
            E confirmo as informações
        Então a compra é finalizada 
