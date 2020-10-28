Quando "o coordenador acessar a página de ações" do
    visit '/actions'
end

Então "deverá ver um formulário contendo as ações cadastradas" do
    page.should have_content "Nome"
    page.should have_content "Resultado"
    page.should have_content "Qt. Consultas"