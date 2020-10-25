require 'rails_helper'

RSpec.describe Action, type: :model do
  before(:each) do
    @appointment = Appointment.new
    @appointment.age = 42
    @appointment.sex = "male"
  end

  it "after create an appointment with disease. Should create action automatically" do
    expect(Action.all.count == 0)

    hiv = Disease.create([{ name: "HIV" }])
    @appointment.diseases << hiv
    @appointment.save

    expect(Action.all.count == 1)
  end

  it "action should be update with name and result" do
    expect(Action.all.count == 0)

    @hiv = Disease.create( name: "HIV" )
    @hiv.save
    @appointment.diseases << @hiv
    @appointment.save

    name = "FRAX"
    result = "incompleto"

    sut = Action.first
    sut.name = name
    sut.result = result

    expect(Action.all.count == 1)

    expect(sut.appointment_id == @appointment.id)
    expect(sut.disease_id == @hiv.id)
    expect(sut.name == name)
    expect(sut.result == result)
  end
end
