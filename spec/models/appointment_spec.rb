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

    hcor = Hospital.create(name: 'Hcor')
    @appointment.hospital = hcor

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

      hcor = Hospital.create(name: 'Hcor')
      @appointment.hospital = hcor

      expect(@appointment).to be_valid
    end
  end
end
