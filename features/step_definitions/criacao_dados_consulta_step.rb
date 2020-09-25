Quando "o cliente requisita POST /appointments com idade {string} e sexo {string}" do |idade, sexo| 
  post "/appointments",
    { :appointment => { :sex => sexo, :age => idade.to_i } }
end

Quando "o cliente requisita POST /appointments somente com idade {string}" do |idade| 
  post "/appointments",
    { :appointment => { :age => idade.to_i } }
end

Quando "o cliente requisita POST /appointments somente com sexo {string}" do |sexo| 
  post "/appointments",
    { :appointment => { :sex => sexo } }
end

Então "a resposta deve conter um id" do
  last_json.should have_json_path("id")
end

Então "a resposta deve conter uma lista de erros"  do
  last_json.should have_json_path("errors")
end
