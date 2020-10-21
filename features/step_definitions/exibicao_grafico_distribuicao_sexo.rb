Quando "o cliente acessa a página de consultas para acessar o gráfico de distribuição por sexo" do
  visit '/appointments'
end

Então "ele vê um gráfico carregando informações sobre o sexo dos pacientes" do
    page.should have_content "Loading.."
end
