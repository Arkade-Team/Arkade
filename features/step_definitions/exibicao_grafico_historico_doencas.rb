Quando('o cliente acessa a página de consultas para acessar o gráfico de quinze diárias por doença') do
    visit '/appointments'
  end
  
  Então('ele vê um gráfico carregando informações das últimas quinze diárias por doença') do
    page.should have_content "Loading.."
  end

  Então('ele não deve ver uma mensagem {string}') do |string|
    page.should_not have_content "Sem historico consultas"
    page.should_not have_selector("div.consultsDiseasesHistory")
  end