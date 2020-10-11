Quando "o cliente acessa a página de consultas" do
  visit '/appointments'
end

Então "ele vê um gráfico carregando informações das últimas 15 diárias por gênero" do
    page.should have_content "Loading.."
end
