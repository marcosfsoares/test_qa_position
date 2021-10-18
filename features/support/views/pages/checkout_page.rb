class CheckoutPage
    include Capybara::DSL
    
    def open
        visit "/checkout-step-one.html"
    end

    def with(firstName, lastName, zipCode)
        find("input[placeholder='First Name']").set firstName
        find("input[placeholder='Last Name']").set lastName
        find("input[placeholder='Zip/Postal Code']").set zipCode

        click_button "Continue"
    end

    def checkout
        return click_button "Checkout"
    end

end