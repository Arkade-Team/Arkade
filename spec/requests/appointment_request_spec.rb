require 'rails_helper'

RSpec.describe "Appointments", type: :request do

  describe "GET /appointments" do
    before(:each) do
      get "/appointments"
    end

    [
      "index",
      "_age_distribution",
      "_day_filter_form",
      "_appointment_per_sex_last_period",
      "_sex_distribution",
      "_appointments_per_disease",
      "_diseases_per_profile",
      "_appointments_per_period",
      "_generate_pdf"
    ].each do |tpl|
      it "renders #{tpl} templates" do
        expect(response).to render_template(tpl)
      end
    end

    [
      :age_distribution
    ].each do |var|
      it "assigns #{var}" do
        expect(assigns(var)).to be_a(Hash)
      end
    end
  end

end
