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

Então "ele deve visualizar a tabela de doenças relacionadas" do
  page.should have_selector("#related_diseases")

  page.should have_selector("#Osteoporose")
  page.should have_selector("#Osteoporose_related")

  page.should have_selector("#Depressão")
  page.should have_selector("#Depressão_related")
end
