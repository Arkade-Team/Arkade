Quando "o cliente acessa a página de consultas para acessar o gráfico por gênero e doenças" do
  visit '/appointments'
end

Então "ele vê um gráfico carregando informações das consultas por gênero e doenças" do
    page.should have_content "Loading.."
end

Quando "o cliente acessa a página de consultas para acessar o gráfico por idades e doenças" do
  visit '/appointments'
end

Então "ele vê um gráfico carregando informações das consultas por idades e doenças" do
    page.should have_content "Loading.."
end
