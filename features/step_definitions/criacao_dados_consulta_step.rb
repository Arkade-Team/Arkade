Quando "o cliente requisita POST /appointments com idade {string} e sexo {string}" do |idade, sexo| 
  post "/appointments",
    { :appointment => { :sex => sexo, :age => idade.to_i } }
end

Então "a resposta deve conter um id" do
  last_json.should have_json_path("id")
end
