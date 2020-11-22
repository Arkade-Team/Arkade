
Quando "o cliente acessa a página de Wikis para visualizar a tabela com as cinco Wikis menos lidas" do
  visit '/wikis'
end

Então "ele vê uma tabela com as informações" do
  page.should have_selector "th[data-ccb=wiki-menos-lida]"
  page.should have_selector "th[data-ccb=wiki-total-menos-lida]"
end
    
