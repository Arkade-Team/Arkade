Quando('o coordenador acessa a página de consultas para ver o rank de doenças') do
    visit '/appointments'
end
  
Então('ele deve listar a tabela dos ranks em ordem crescente.') do
    page.should have_content "Doenças Mais Consultadas"
end

E('listar a tabela de doenças raras.') do
    page.should have_content "Doenças Raras"
end

Então('ele deve listar a tabela dos ranks com a mensagem de sem consultas.') do
    page.should have_content "Sem consultas"
    page.should have_selector "#sem_consultas_rank"
    page.should have_selector "#sem_consultas_raras"
end