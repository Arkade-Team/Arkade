require 'rails_helper'

RSpec.describe DiseaseController, type: :request do
  it 'calls the model method that aggregates related diseases' do
    mocked_pairs = { "Depressão" => { "HIV" => 1 }, "HIV" => { "Depressão" => 1 } }
    expect(Disease).to receive(:related_pairs) { mocked_pairs }
    get '/diseases'
  end

  it 'calls disease/index template view' do
    get '/diseases'
    expect(response).to render_template('index')
  end

  it 'fails to create without a valid appointment id' do
    Appointment.delete_all
    post '/appointments/1/diseases'

    resp = JSON.parse(response.body)
    expect(resp["error"]).not_to be_nil
    expect(resp["error"]).to eq("appointment 1 not found")
  end

  it 'returns a list of diseases when success' do
    app = Appointment.create sex: "male", age: 42

    post "/appointments/#{app.id}/diseases",
      params: { diseases: [{ name: "Osteoporose" }, { name: "HIV" }] }

    resp = JSON.parse(response.body)
    expect(resp.size).to be(2)

    resp_diseases = resp.collect{ |disease| disease["name"] }.sort
    expect(resp_diseases).to eq(["Osteoporose", "HIV"].sort)
  end
end
