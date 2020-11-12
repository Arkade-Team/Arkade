  Quando('o cliente requisita POST \/hospitals com nome {string}') do |name|
    post "/hospitals",
    { :hospital => { :name => name } }
  end
  
  Quando('o coordenador acessar a página de hospitais') do
    Appointment.delete_all
    Hospital.delete_all
    @appointment = Appointment.create sex: "female", age: 55
    @hcor = Hospital.create(name: "Hcor")
    @appointment.hospital = @Hcor
    @appointment.save

    visit '/hospitals'
  end
  
  Então('deverá ver uma lista de hospitais cadastrados') do
    last_json.should have_json_path("name")
  end
