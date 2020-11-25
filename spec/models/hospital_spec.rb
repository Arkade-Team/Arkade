require 'rails_helper'

RSpec.describe Hospital, type: :model do
  before(:each) do
    @hospital = Hospital.create(name: "Hcor")
    @hospital.save
  end

  it "should fail if the name has already be used" do
    sut = Hospital.create(name: "Hcor")
    sut.save
    expect(sut).not_to be_valid
  end

  it "should have appointments into the hospital" do
    expect(@hospital.appointments.count).to eq(0)
    
    appointment = Appointment.new
    appointment.age = 42
    appointment.sex = " MALE "
    appointment.hospital = @hospital
    appointment.save

    expect(@hospital.appointments.count).to eq(1)
  end

end
