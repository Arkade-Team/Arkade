Quando "o cliente acessa a página de consultas" do
    visit '/appointments'
end

Então "ele vê um gráfico contendo o titulo {string}" do |title|
    page.should have_content title
end
