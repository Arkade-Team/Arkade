require 'json'
Dado "uma consulta de {string} de {string} anos" do |sex, age|
  @appointment = Appointment.create(sex: sex, age: age)
  @appointment.hospital = Hospital.create(name: 'Hcor')
  @appointment.save
end

Dado "nenhuma consulta" do
  @appointment = Appointment.new
  @appointment.hospital = Hospital.create(name: 'Hcor')
  @appointment.save
end

Dado "uma consulta que investigou {string}" do |disease|
  Disease.delete_all
  Appointment.delete_all
  Hospital.delete_all 

  @appointment = Appointment.create(sex: "female", age: 54)

  @hcor = Hospital.create(name: 'Hcor')
  @hcor.save
  @appointment.hospital = @hcor

  @disease = Disease.find_by_name(disease) || Disease.create(name: disease)
  @appointment.diseases << @disease

  @appointment.save

end

Quando "o cliente investiga {string}" do |nome| 
  a_id = @appointment.id
  post "/appointments/#{a_id || "_"}/diseases",
    { :diseases => [{ name: nome }] }
end

Quando "o cliente acessa a homepage" do
  visit '/'
end

Quando "o cliente clica em {string}" do |button|
  click_link button
end

Então "a resposta deve ser uma lista contendo um único id" do
  resp = JSON.parse last_json
  resp.should satisfy do |diseases|
    diseases.size == 1 and diseases.first["id"]
  end
end

Então "a resposta deve ser um erro" do
  resp = JSON.parse last_json
  resp.should have_key("error")
end

Então "ele vê um jumbotron" do
  page.should have_selector(".jumbotron")
end
