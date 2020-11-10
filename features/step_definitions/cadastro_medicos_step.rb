Dado('que estou na página de cadastro de médico') do 
    visit 'doctors/new'
end

Quando('preencho o {string} com {string}') do |string, string2|
    fill_in string, :with => string2
end

Quando('clico em salvar') do
    click_on 'Salvar'
end

Então('ele deve ser salvo no banco de dados') do 
    doctor = Doctor.order("id").last
    expect(doctor.crm).to eq('0111222/SP')
    expect(doctor.name).to eq('Alécio Godoi')
    expect(doctor.specialty).to eq('Cardiologista')
end

Então('verei o médico na página de dados de médico') do
    expect(page).to eq('0111222/SP')
    expect(page).to eq('Alécio Godoi')
    expect(page).to eq('Cardiologista')
end

Quando('deixo o campo {string} vazio') do |string| 
    fill_in string, :with => ""
end

Então('verei uma mensagem de erro {string}') do |string| 
    expect(page).to have_content(string)
end



