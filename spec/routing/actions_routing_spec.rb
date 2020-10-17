require "rails_helper"

RSpec.describe ActionsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/actions").to route_to("actions#index")
    end

    it "routes to #new" do
      expect(get: "/actions/new").to route_to("actions#new")
    end

    it "routes to #show" do
      expect(get: "/actions/1").to route_to("actions#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/actions/1/edit").to route_to("actions#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/actions").to route_to("actions#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/actions/1").to route_to("actions#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/actions/1").to route_to("actions#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/actions/1").to route_to("actions#destroy", id: "1")
    end
  end
end
