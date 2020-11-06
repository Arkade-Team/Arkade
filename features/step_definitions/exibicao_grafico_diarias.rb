Quando "o cliente acessa a página de consultas para acessar o gráfico de um período por gênero" do
    visit '/appointments'
  end
  
  Então "ele vê um gráfico carregando informações do período selecionado por gênero" do
      page.should have_content "Loading.."
  end
  