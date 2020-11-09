Quando('o coordenador acessa a página de consultas por período') do
    visit '/appointments'
  end
  
  Então('ele vê uma tabela contendo o total de consultas por período') do
    page.should have_content "Período"
  end
  
  Então('um botão {string} para o detalhamento diario.') do |string|
    page.should have_content "Detalhes"
    page.should have_selector("div.detalhes_periodo")
  end