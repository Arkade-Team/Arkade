Quando "o coordenador acessar a página de ações" do
    visit '/actions'
end

# Quando "o cliente requisita POST para adicionar ações com nome {string} e resultado {string} na consulta {string} com doença {string}" do |name, result, appointment, disease| 
#     post "/appointments/#{appointment}/diseases/#{disease}/actions", { :name => name, :result => result }
# end

Então "deverá ver um formulário contendo as ações cadastradas" do
    page.should have_content "Nome"
    page.should have_content "Resultado"
    page.should have_content "Qt. Consultas"
end

# Então "a resposta deve conter uma ação" do
#     last_json.should have_json_path("id")
#     last_json.should have_json_path("fabio")
#     last_json.should have_json_path("result")
# end
 

