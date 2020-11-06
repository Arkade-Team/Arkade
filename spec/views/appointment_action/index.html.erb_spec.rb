require "rails_helper"

RSpec.describe "appointment_action/index.html.erb" do
  context "exibition actions" do
    it "should present an form with data" do

      assign(:actions, Action.all)

      render

      expect(rendered).to have_text(/Ações/)
      expect(rendered).to have_text(/Nome/)
      expect(rendered).to have_text(/Resultado/)
      expect(rendered).to have_text(/Qt. Consultas/)
    end
  end
end