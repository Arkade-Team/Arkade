class AppointmentController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:create]

  def index 
    @appointments = Appointment.all
    @daysAgo = 15
    @fifteenDaysAgo = Time.now - (@daysAgo * 24 * 60 * 60)
    @lastFifteenDays = Appointment.where("created_at >= ?", @fifteenDaysAgo ).group('sex').order('sex').group('date(created_at)').order('date(created_at)').count
    @lastFifteenDaysPeriodo = Appointment.where("created_at >= ?", @fifteenDaysAgo ).group('date(created_at), id').order('date(created_at)')
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
