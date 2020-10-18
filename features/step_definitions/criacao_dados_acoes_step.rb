# require 'json'

# Dado "uma consulta existente de Osteoporose" do
#   @appointment = Appointment.create(sex: "male", age: 49)
#   @disease = Disease.create(name: "Osteoporose")
#   @appointment.diseases << @disease
# end

# Quando "a ação tomada é {string}" do |nome| 
#   gym = Action.create(name: nome, result: "", method: 1)
#   @appointment.actions = [gym]
# end

# Então "a resposta deve ser uma lista contendo o nome da ação {string}" do |nome|
# end

# Quando "o cliente procurar a ação de {string}" do |nome| 
#   a_id = @appointment.id
#   post "/appointments/#{a_id || "_"}/actions",
#     { :actions => [{ name: nome }] }
# end