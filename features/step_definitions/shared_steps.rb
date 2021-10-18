Então('sou redirecionado para a página de produtos') do
    expect(page).to have_css ".inventory_list"
end
