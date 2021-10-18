#language: pt

Funcionalidade: Realizar Login
    Sendo um cliente cadastrado no e-commerce
    Quero realizar o login no site 
    Para que eu possa escolher os produtos para comprar

    @login
    Cenario: Realizar login

        Dado que acesso a página principal do e-commerce
        Quando submeto minhas credenciais com "standard_user" e "secret_sauce" 
        Então sou redirecionado para a página de produtos

    @login
    Esquema do Cenario: Tentativa de login
        Dado que acesso a página principal do e-commerce
        Quando submeto minhas credenciais com "<username_input>" e "<password_input>"        
        Então vejo a mensagem de alerta: "<mensagem_output>"
    Exemplos:
    |username_input |password_input|mensagem_output                                                          |
    |standard_user  |#secret_sauce |Epic sadface: Username and password do not match any user in this service|
    |locked_out_user|secret_sauce  |Epic sadface: Sorry, this user has been locked out.                      |
