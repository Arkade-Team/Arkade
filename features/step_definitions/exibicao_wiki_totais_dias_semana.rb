
Quando "o cliente acessa a página de Wikis para visualizar o Total de Leituras de Wikis por Dia da Semana" do
  visit '/wikis'
end

Então "ele vê um gráfico de barras carregando o Total de Leituras de Wikis por Dia da Semana" do
  page.should have_selector "div[data-ccb=wiki-total-dia-semana]"
end
    
