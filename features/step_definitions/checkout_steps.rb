Dado('clico no ícone do carrinho') do
    find('.shopping_cart_link').click
    expect(page).to have_selector('.title', :text => "YOUR CART")

end
  
Quando('clico no botão checkout') do
    click_button "Checkout"
end
  
Então('vou para a página de informações de entrega') do
    expect(page).to have_selector('.title', :text => "CHECKOUT: YOUR INFORMATION")
end

Quando('preencho o formulário com nome {string}, ultimo nome {string} e cep {string}') do |firstName, lastName, zipCode|
    @checkout_page = CheckoutPage.new
    @checkout_page.with(firstName, lastName, zipCode)
end
  
Quando('confirmo as informações') do
    expect(page).to have_selector('.title', :text => "CHECKOUT: OVERVIEW")
    click_button "Finish"
end
  
Então('a compra é finalizada') do
    expect(page).to have_selector('.title', :text => "CHECKOUT: COMPLETE!")
    expect(page).to have_selector('.complete-header', :text => "THANK YOU FOR YOUR ORDER")

end
