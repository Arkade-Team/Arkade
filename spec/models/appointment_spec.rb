require 'rails_helper'

RSpec.describe Appointment, type: :model do
  describe "validation" do
    before(:each) do
      @appointment = Appointment.new
    end

    it "fails to create without sex" do
      @appointment.age = 42

      expect(@appointment).not_to be_valid
    end

    it "fails to create without age" do
      @appointment.sex = "female"

      expect(@appointment).not_to be_valid
    end

    it "fails to create when age is not number" do
      @appointment.age = "quarenta e dois"
      @appointment.sex = "female"

      expect(@appointment).not_to be_valid
    end

    it "fails to create when sex isn't exactally male or female" do
      @appointment.age = 42
      @appointment.sex = "male anything"

      expect(@appointment).not_to be_valid
    end

    it "accepts ' MALE ' as a valid sex" do
      @appointment.age = 42
      @appointment.sex = " MALE "

      expect(@appointment).to be_valid
    end
    
    it "accepts ' FEMALE ' as a valid sex" do
      @appointment.age = 37
      @appointment.sex = " FEMALE "

      expect(@appointment).to be_valid
    end
  end

  describe "query methods" do
    describe "age_distribution" do
      before(:each) do
        Appointment.delete_all
      end

      it "is defined" do
        expect(Appointment).to respond_to(:age_distribution)
      end

      it "always returns a Hash" do
        expect(Appointment.age_distribution).to be_a(Hash)

        Appointment.create([
          { sex: "male", age: 40 },
          { sex: "female", age: 80 },
          { sex: "male", age: 60 },
        ])

        expect(Appointment.age_distribution).to be_a(Hash)
      end

      it "returns an empty hash when there is no data" do
        expect(Appointment.age_distribution).to eql({})
      end

      it "return the correct counting when there is data" do
        Appointment.create([
          { age: 40, sex: "male" },
          { age: 45, sex: "female" },
          { age: 40, sex: "female" },
        ])

        expect(Appointment.age_distribution).to eql({ 40 => 2, 45 => 1 })
      end
    end
  end
end
