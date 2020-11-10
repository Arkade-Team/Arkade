require 'rails_helper'

RSpec.describe "Wikis", type: :request do

  describe "GET /update" do
    it "returns http success" do
      get "/wiki/update"
      expect(response).to have_http_status(:success)
    end
  end

end
