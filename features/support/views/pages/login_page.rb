

class LoginPage
    include Capybara::DSL
    
    def open
        visit "/"
    end

    def with(username, password)
        find("input[placeholder='Username']").set username
        find("input[placeholder='Password']").set password
        click_button "Login"
    end

    def alert
        return  find(".error-message-container").text
    end

end