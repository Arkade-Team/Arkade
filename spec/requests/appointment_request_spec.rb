require 'rails_helper'

RSpec.describe "Appointments", type: :request do

  describe "GET /appointments" do
    describe "rendering and assigning" do
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
        sex_per_last_period: Hash,
        sex_per_last_period_title: String,
        appointments_per_disease: Hash,
        diseases_per_age: Hash,
        sex_per_diseases: Hash,
        sex_distribution: Hash,
        arrayPeriodo: Array,
        total_madrugada: Integer,
        total_manha: Integer,
        total_tarde: Integer,
        total_noite: Integer
      }.each_pair do |var, type|
        it "assigns #{var}" do
          expect(assigns(var)).to be_a(type)
        end
      end
    end

    [
      {
        name: :age_distribution,
        mocked: { 40 => 1 }
      },
      {
        name: :sex_per_last_period,
        mocked: {
          ["male", 3.days.ago.to_date] => 1,
          ["female", 2.days.ago.to_date] => 1,
        },
      },
      {
        name: :appointments_per_disease,
        mocked: {
          ["Osteoporose", 2.days.ago.to_date] => 2,
          ["Depressão", 2.days.ago.to_date] => 1,
        }
      },
      {
        name: :diseases_per_age,
        mocked: {
          ["Osteoporose", 77] => 2,
          ["Depressão", 41] => 6,
        }
      },
      {
        name: :sex_per_diseases,
        mocked: {
          ["male", "Depressão"] => 2,
          ["female", "Osteoporose"] => 1
        }
      },
      {
        name: :sex_distribution,
        mocked: {
          "male" => 4,
          "female" => 3
        }
      }
    ].each do |scene|
      it "calls Appointment##{scene[:name]} and assigns to @#{scene[:name]}" do
        expect(Appointment).to receive(scene[:name]) { scene[:mocked] }

        get "/appointments"

        expect(assigns(scene[:name])).to eql(scene[:mocked]) 
      end
    end

    it "sets different titles for periods greater than 0" do
      days = 4
      get "/appointments", params: { days: days }

      expect(assigns(:sex_per_last_period_title)).to eql("dos últimos #{days} dias")
    end
  end

  describe "POST /appointments" do
    it "fails when requested without parameters" do
      expect { post "/appointments" }.not_to raise_error
    end

    it "returns :parameter_missing when requested without parameters" do
      post "/appointments"

      expect(response.body).to include("error")
    end

    [
      { sex: "foo", age: 42 },
      { sex: "female", age: -1 },
      { sex: "female", age: 130 },
      { sex: "foo", age: -1 },
      { sex: "male" },
      { age: 42 },
    ].each do |params|
      it "returns a list of errors when requested with #{ params }" do
        post "/appointments", params: { appointment: params }

        expect(response.body).to include("errors")
      end
    end

    it "returns the just-created register when all params are ok" do
      post "/appointments", params: { appointment: { sex: "male", age: 42 } }

      ["sex", "age", "id"].each do |attr|
        expect(response.body).to include(attr)
      end
    end
  end

end
