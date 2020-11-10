Quando "o cliente acessa a página de médicos" do
  visit '/doctors'
end

Então "ele vê um gráfico de barras com o total de médicos por especialidades" do
    page.should have_content "Loading.."
end
