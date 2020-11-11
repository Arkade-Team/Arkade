require 'rails_helper'

RSpec.describe "Wikis", type: :request do

  describe "PUT /wikis" do
    before(:each) do
      Wiki.delete_all
    end

    it "fails without :readingtime parameter" do
      put '/wikis'
      expect(response).not_to have_http_status(:success)
    end

    it "returns a wiki register when the name is provided" do
      put '/wikis', params: { readingtime: { wiki: { name: "Foo" } } }

      resp = JSON.parse(response.body)

      expect(resp["wiki"]).not_to be_nil
    end

    it "returns a wiki register when a repeated name is provided" do
      repeated_name = "Foo"
      Wiki.create(name: repeated_name)

      put '/wikis', params: { readingtime: { wiki: { name: repeated_name } } }

      resp = JSON.parse(response.body)

      expect(resp["wiki"]).not_to be_nil
    end

    it "fails when wiki information is invalid" do
      too_short_name = "" 

      put '/wikis', params: { readingtime: { wiki: { name: too_short_name } } }

      resp = JSON.parse(response.body)

      expect(resp["wiki"]).to be_nil
    end
  end

end
