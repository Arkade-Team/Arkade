require 'rails_helper'

RSpec.describe Disease, type: :model do
  before(:each) do
    Disease.delete_all
  end

  describe "instanciation" do
    before(:each) do
      @disease = Disease.new
    end

    it "fails to create without name" do
      expect(@disease).not_to be_valid
    end

    it "fails to create duplicated name" do
      dup_name = "Foo"
      Disease.create(name: dup_name)
      @disease.name = dup_name
      expect(@disease).not_to be_valid
    end

    it "fails to create names that are too short" do
      @disease.name = "a"
      expect(@disease).not_to be_valid
    end
  end

  describe :related_pairs do
    before(:each) do
      @depre = Disease.create name: "Depressão"
      @osteo = Disease.create name: "Osteoporose"

      @appointment = Appointment.create age: 55, sex: "male"
      @appointment.diseases << @depre
      @appointment.diseases << @osteo
    end

    it "returns a double-indexed hash with the count" do
      hash = Disease.related_pairs

      expect(hash).to have_key("Depressão")
      expect(hash["Depressão"]).to have_key("Osteoporose")
      expect(hash["Depressão"]["Osteoporose"]).to equal(1)

      expect(hash).to have_key("Osteoporose")
      expect(hash["Osteoporose"]).to have_key("Depressão")
      expect(hash["Osteoporose"]["Depressão"]).to equal(1)
    end
  end
end
