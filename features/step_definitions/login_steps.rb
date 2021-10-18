Dado('que acesso a página principal do e-commerce') do
    @login_page = LoginPage.new
    @login_page.open
end
  
Quando('submeto minhas credenciais com {string} e {string}') do |username, password|  
    @login_page.with(username, password)
end

Então('vejo a mensagem de alerta: {string}') do |alerta|
    
    expect(@login_page.alert).to eql alerta
end