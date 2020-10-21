require 'rails_helper'

RSpec.describe "Appointments", type: :request do
    it 'calls appointment/index template view' do
        get '/appointment'
        expect(response).to render_template('index')
      end

end
