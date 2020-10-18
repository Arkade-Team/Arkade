require 'rails_helper'

RSpec.describe Action, type: :model do
    
    before(:each) do
        @action = Action.new

        @appointment = Appointment.new
        @appointment.age = 42
        @appointment.sex = " MALE "
    end

    it "fails to create without method" do
        @action.name = "Vitamin C"
    end

    it "fails actions when is empty" do 
        expect(@appointment.actions.count) == 0
    end

    it "should return appointment with action" do 
        @appointment.actions = [Action.create(name: "Advil", result: "Dor de cabeça", method: 1)]

        expect(@appointment.actions.count) == 1
    end

    it "should verify if ternary relations is correct" do
        osteo = Disease.create name: "Osteoporose"
        action = Action.create(name: "Advil", result: "Dor de cabeça", method: 1)

        # osteo.actions << action
        
        @appointment.diseases << osteo
        @appointment.actions << action

        expect(@appointment.actions).to include(action)
        # expect(@appointments.diseases.first.actions).to include(action)
    end

end