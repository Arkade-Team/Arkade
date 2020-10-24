Quando('o coordenador acessa a página de consultas por período') do
    visit '/appointments'
  end
  
  Então('ele vê uma tabela contendo a quantidade de consultas por período') do
    page.should have_content "Período"
    
  end