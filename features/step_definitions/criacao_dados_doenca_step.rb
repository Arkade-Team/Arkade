require 'json'
Dado "uma consulta de {string} de {string} anos" do |sex, age|
  @appointment = Appointment.create(sex: sex, age: age)
end

Quando "o cliente investiga {string}" do |nome| 
  a_id = @appointment.id
  post "/appointments/#{a_id}/diseases",
    { :diseases => [{ name: nome }] }
end

Então "a resposta deve ser uma lista contendo um único id" do
  resp = JSON.parse last_json
  resp.should satisfy do |diseases|
    diseases.size == 1 and diseases.first["id"]
  end
end
