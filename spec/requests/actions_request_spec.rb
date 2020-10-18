require 'rails_helper'

RSpec.describe ActionController, type: :request do

    it 'calls action/index template view' do
      get '/actions'
      expect(response).to render_template('index')
    end
end