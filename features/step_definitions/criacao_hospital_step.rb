  Quando('o cliente requisita POST \/hospitals com nome {string}') do |name|
    post "/hospitals",
    { :hospital => { :name => name } }
  end
  
  Quando('o coordenador acessar a página de hospitais') do
    visit '/hospitais'
  end
  
  Então('deverá ver uma lista de hospitais cadastrados') do
    last_json.should have_json_path("id")
  end

  Quando('clicar no hospital {string}') do |button|
    click_link button
  end
  
  Então('deverá ver uma lista de agendamentos realizados') do
    last_json.should have_json_path("id")
  end