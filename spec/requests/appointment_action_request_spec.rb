require 'rails_helper'

RSpec.describe "AppointmentActions", type: :request do
    describe "GET /index" do
        it "renders a successful response" do
          get '/actions'
          expect(response).to be_successful
          expect(response).to render_template('index')
          expect(response.status).to eq 200
    
        end
      end

    describe "POST /create" do
        context "with valid parameters" do
        it "creates a new AppointmentAction" do
            
            app = Appointment.create sex: "male", age: 42
            hiv = Disease.create name: "HIV"
            
            app.diseases << hiv

            post "/appointments/#{app.id}/diseases/#{hiv.id}/actions",
            params: { name: "FRAX", result: "Completo"}

            resp = JSON.parse(response.body)
            expect(resp["error"]).to be_nil
            expect(response.status).to eq 200
        end
        end

        context "with wrong valid parameters" do
            it "creates a new AppointmentAction" do
                
                app = Appointment.create sex: "male", age: 99
                hiv = Disease.create name: "HIV+"
                
                app.diseases << hiv
    
                post "/appointments/#{app.id}/diseases/#{hiv.id}/actions"
    
                resp = JSON.parse(response.body)
                expect(resp["error"]).not_to be_nil
                expect(response.status).to eq 400
            end
            end
    end

end
