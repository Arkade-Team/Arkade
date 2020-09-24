require 'rails_helper'

RSpec.describe "Appointments", type: :request do

  describe "GET /create" do
    it "returns http success" do
      get "/appointment/create"
      expect(response).to have_http_status(:success)
    end
  end

end
