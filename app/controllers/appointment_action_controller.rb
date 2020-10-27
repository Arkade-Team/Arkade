class AppointmentActionController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:create]
  
    def index
        @actions = Action.group(:name, :result).count(:name)
    end

    def create
        appointment = params[:appointment_id]
        disease = params[:disease_id]
        
        @action = Action.find_by(appointment_id: appointment, disease_id: disease)
        @action.name = params[:name]
        @action.result = params[:result]

        if @action.save
          render json: @action
        else
          render json: { errors: @action.errors }
        end
      end
end