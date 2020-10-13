require 'rails_helper'

RSpec.describe DiseaseController, type: :request do
  it 'calls the model method that aggregates related diseases' do
    expect(Disease).to receive(:related_pairs)
    get '/diseases'
  end

  it 'calls disease/index template view' do
    get '/diseases'
    expect(response).to render_template('index')
  end
end
