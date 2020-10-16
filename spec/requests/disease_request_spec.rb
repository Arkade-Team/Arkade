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
end
