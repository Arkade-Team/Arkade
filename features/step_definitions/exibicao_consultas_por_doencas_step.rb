Quando('o coordenador acessa a página de deonças investigadas') do
  visit '/diseases'
end

Então('ele vê uma tabela contendo <Doença> e <Qt. Consultas>') do
  page.should have_selector "div.consult_diseases"
  page.should have_content "Total de consultas por doenças"
end
