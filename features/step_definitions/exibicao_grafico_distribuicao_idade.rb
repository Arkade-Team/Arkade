Quando "o cliente acessa a homepage" do
    visit '/'
  end
  
Quando "o cliente clica em {string}" do |button|
click_link button
end

Então "ele vê um gráfico carregando informações" do
    page.should have_content "Loading.."
end
