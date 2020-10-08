class AppointmentController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:create]

  def index 
    @appointments = Appointment.all
  end

  def create
    @appointment = Appointment.new appointment_params

    if @appointment.save
      render json: @appointment
    else
      render json: { errors: @appointment.errors }
    end
  end

  private
    def appointment_params
      params.require(:appointment).permit(:age, :sex)
    end
end
