require "rails_helper"

RSpec.describe ActionsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/actions").to route_to("actions#index")
    end

    it "routes to #new" do
      expect(get: "/actions/new").to route_to("actions#new")
    end

    it "routes to #create" do
      expect(post: "/actions").to route_to("actions#create")
    end

  end
end
