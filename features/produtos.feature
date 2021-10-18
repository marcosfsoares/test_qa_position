#language: pt

Funcionalidade: Filtrar e selecionar produtos
    Sendo um cliente cadastrado no e-commerce
    Quero realizar o login no site 
    Para que eu possa escolher os produtos e comprar

    @ordenar
    Cenario: Ordenar produtos por preço crescente

        Dado que estou logado como "standard_user" e "secret_sauce"
        Quando filtro os produtos por preço crescente
        Então os produtos são mostrados com preço em ordem crescente

    @adicionar
    Cenario: Adicionar produtos ao carrinho

        Dado que estou logado como "standard_user" e "secret_sauce"
            E filtro os produtos por preço crescente
            E os produtos são mostrados com preço em ordem crescente
        Quando adiciono os produtos "Sauce Labs Onesie" e "Test.allTheThings() T-Shirt (Red)" ao carrinho  
        Então o ícone do carrinho mostra a quantidade adicionada
