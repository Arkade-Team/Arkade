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

    {
      age_distribution: Hash,
      sex_per_last_period: Hash,
      sex_per_last_period_title: String,
      appointments_per_disease: Hash,
      diseases_per_age: Hash,
      sex_per_diseases: Hash,
      sex_distribution: Hash,
    }.each_pair do |var, type|
      it "assigns #{var}" do
        expect(assigns(var)).to be_a(type)
      end
    end
  end

end
