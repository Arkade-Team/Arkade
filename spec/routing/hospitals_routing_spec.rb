require "rails_helper"

RSpec.describe HospitalsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/hospitals").to route_to("hospitals#index")
    end

    it "routes to #new" do
      expect(get: "/hospitals/new").to route_to("hospitals#new")
    end

    it "routes to #show" do
      expect(get: "/hospitals/1").to route_to("hospitals#show", id: "1")
    end
    
    it "routes to appointments" do
      expect(get: "/hospitals/1/appointments").to route_to("hospitals#appointments", hospital: "1")
    end

    it "routes to #create" do
      expect(post: "/hospitals").to route_to("hospitals#create")
    end
  end
end
