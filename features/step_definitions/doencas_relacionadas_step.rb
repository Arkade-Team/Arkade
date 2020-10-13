Dado "apenas uma consulta histórica" do
  Appointment.delete_all
  Disease.delete_all
  @appointment = Appointment.create sex: "female", age: 55
end

Dado "nesta consulta foi investigado Osteoporose e Depressão" do
   osteo = Disease.create name: "Osteoporose" 
   depre = Disease.create name: "Depressão"

   @appointment.diseases << osteo
   @appointment.diseases << depre
end

Então "ele deve visualizar uma tabela com id {string}" do |id_selector|
  page.should have_selector("##{id_selector}")
end
