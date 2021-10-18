Dado('que estou logado como {string} e {string}') do |username, password|
    @login_page = LoginPage.new
    @login_page.open
    @login_page.with(username, password)
end
  
Quando('filtro os produtos por preço crescente') do
    produtos_page = ProdutosPage.new
    produtos_page.ordenarPrecos_lohi 
    sleep(10)
end
  
Então('os produtos são mostrados com preço em ordem crescente') do
    crescente = find(".active_option")
    expect(crescente.text).to eql "PRICE (LOW TO HIGH)"
end

Quando('adiciono os produtos {string} e {string} ao carrinho') do |string, string2|
    @conta_produtos = 0
    produtos_page = ProdutosPage.new
    produtos_page.adicionar(string)
    @conta_produtos = @conta_produtos + 1
    produtos_page.adicionar(string2)
    @conta_produtos = @conta_produtos + 1
    sleep(4)
end

  
#Então('o botão ADD TO CART muda para REMOVE') do

#end
  
Então('o ícone do carrinho mostra a quantidade adicionada') do
    produtos_page = ProdutosPage.new
    expect(page).to have_selector('.shopping_cart_badge', :text =>(@conta_produtos).to_s)

end