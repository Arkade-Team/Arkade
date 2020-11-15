class AppointmentController < ApplicationController
  before_action :set_period, only: [:index]
  skip_before_action :verify_authenticity_token, only: [:create]
  rescue_from ActionController::ParameterMissing,
              with: :parameter_missing

  def index 
    @age_distribution =
      Appointment.age_distribution

    @sex_per_last_period =
      Appointment.sex_per_last_period @beginning_of_period

    @sex_per_last_period_title =
      sex_per_last_period_title

    @appointments_per_disease =
      Appointment.appointments_per_disease @beginning_of_period

    @diseases_per_age = Appointment.diseases_per_age

    @sex_per_diseases = Appointment.sex_per_diseases

    @sex_distribution = Appointment.sex_distribution

    @arrayPeriodo,
      @total_madrugada,
      @total_manha,
      @total_tarde,
      @total_noite =
        Appointment.appointments_per_day_period @beginning_of_period
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

    def parameter_missing
      render json: { error: :parameter_missing }
    end

    def set_period
      @last_period_length =
        if params[:days].present?
          params[:days].to_i.abs
        else
          0
        end

      dt = @last_period_length.days

      @beginning_of_period =
        if @last_period_length != 0
          Time.now - dt
        else
          Date.today - dt
        end
    end

    def sex_per_last_period_title
      if @last_period_length == 0
        "do último dia"
      else
        "dos últimos #{@last_period_length} dias"
      end
    end
end
