class ProdutosPage
    include Capybara::DSL
    
    def open
        visit "/inventory.html"
    end

    def ordenarPrecos_lohi
        return find(".product_sort_container").find("option[value='lohi']").select_option
    end

    def adicionar(escolha)
        id_value = " "
        buttonId_addList = [
            "#add-to-cart-sauce-labs-backpack",
            "#add-to-cart-sauce-labs-bike-light",
            "#add-to-cart-sauce-labs-bolt-t-shirt",
            "#add-to-cart-sauce-labs-fleece-jacket",
            "#add-to-cart-sauce-labs-onesie",
            '//*[@id="add-to-cart-test.allthethings()-t-shirt-(red)"]' 
        ]

        case escolha
        when "Sauce Labs Onesie"
            id_value = buttonId_addList[4]
            
        when "Test.allTheThings() T-Shirt (Red)"
            return find(:xpath, buttonId_addList[5]).click
        end      
        return find(id_value).click 
            

    end

end