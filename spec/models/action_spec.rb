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

    it "test" do
       
#         # gym = Action.crea(e name: "Exercicios físicos", result: "Prevenir a perda óssea", method:) 1
#         # sun = Action.crea(e name: "Exposição ao Sol ", result: "Vitamina D", method:) 1

# # appointment = Appointment.find_by(id: 1)
#  @appointment.actions = [gym, sun]

    puts Appointment.joins(:actions).where(actions: { name: 'Exercicios físicos' }.distinct.pluck(:name))

# Student.find_by(name: 'Bart Simpson').tutors  # find all Bart's tutors
# Student.joins(:klasses).where(klasses: {subject: 'Maths'}).distinct.pluck(:name) # get all students who attend the Maths class
# Student.joins(:tutors).joins(:klasses).where(klasses: {subject: 'Maths'}, tutors: {name: 'Mrs Krabapple'}).distinct.map {|x| puts x.name} # get all students who attend Maths taught by Mrs Krabapple


    end
    end

end