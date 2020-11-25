
Quando "o cliente acessa a página de Wikis para visualizar a tabela com as cinco Wikis mais lidas" do
  visit '/wikis'
end

Então "ele visualiza uma tabela com as informações" do
  page.should have_selector "th[data-ccb=wiki-mais-lida]"
  page.should have_selector "th[data-ccb=wiki-total-mais-lida]"
end
    
