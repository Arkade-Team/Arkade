class AppointmentActionController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:create]
  
    def index
        @actions = Action.group(:name, :result).count(:name)
    end

    def create
        name = params[:name]
        result = params[:result]
       
        if name && result
          
          appointment = params[:appointment_id]
          disease = params[:disease_id]
         
          @action = Action.find_by(appointment_id: appointment, disease_id: disease)
          @action.name = name
          @action.result = result

          if @action.save
            render json: @action
          else
            render json: { errors: @action.errors }
          end

        else 
          render json: { error: "Missing Params" }, status: 400
        end
      end
end