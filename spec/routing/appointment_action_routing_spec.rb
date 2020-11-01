require "rails_helper"

RSpec.describe AppointmentActionController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/actions").to route_to("appointment_action#index")
    end

    it "routes to #create" do
      expect(post: "/appointments/1/diseases/2/actions").to route_to("appointment_action#create", appointment_id: "1", disease_id: "2")
    end
  end
end
