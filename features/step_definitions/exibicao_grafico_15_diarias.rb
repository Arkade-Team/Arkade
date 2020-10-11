Quando "o cliente acessa a página de consultas para acessar o gráfico de quinze diárias por gênero" do
  visit '/appointments'
end

Então "ele vê um gráfico carregando informações das últimas quinze diárias por gênero" do
    page.should have_content "Loading.."
end
