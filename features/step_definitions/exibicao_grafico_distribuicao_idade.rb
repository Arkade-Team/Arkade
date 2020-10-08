Quando "o cliente acessa a página de consultas" do
  visit '/appointments'
end

Então "ele vê um gráfico carregando informações" do
    page.should have_content "Loading.."
end
