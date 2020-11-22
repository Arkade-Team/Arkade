
Quando "o cliente acessa a página de Wikis para visualizar o Total geral de leituras das Wikis [A]" do
  visit '/wikis'
end

Então "ele vê um painel carregando o Total geral de leituras das Wikis [A]" do
  page.should have_selector "div[data-ccb=total-geral]"
end


Quando "o cliente acessa a página de Wikis para visualizar o Total de dias distintos de leituras das Wikis [B]" do
  visit '/wikis'
end

Então "ele vê um painel carregando o Total de dias distintos de leituras das Wikis [B]" do
  page.should have_selector "div[data-ccb=total-dias-distintos]"
end


Quando "o cliente acessa a página de Wikis para visualizar a Média de Leituras por Dia = [B] / [A]" do
  visit '/wikis'
end

Então "ele vê um painel carregando a Média de Leituras por Dia = [B] / [A]" do
  page.should have_selector "div[data-ccb=media-leituras]"
end
