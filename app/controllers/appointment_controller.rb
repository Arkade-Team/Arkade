class AppointmentController < ApplicationController
  before_action :set_period, only: [:index]
  skip_before_action :verify_authenticity_token, only: [:create]

  def index 
    @age_distribution = Appointment.age_distribution

    @sex_per_last_period = Appointment.sex_per_last_period @beginning_of_period
    @sex_per_last_period_title = sex_per_last_period_title

    @appointments_per_disease = appointments_per_disease

    @diseases_per_age = diseases_per_age
    @sex_per_diseases = sex_per_diseases

    @sex_distribution = sex_distribution


    ConsultarPeriodo()
  end

  def regraPeriodoCase
    case @consulta.hour
    when 0..5
      @periodo = "Madrugada"
      @total_madrugada +=1
      @madrugada +=1
    when 6..11
      @periodo = "Manhã" 
      @total_manha +=1
      @manha +=1 
    when 12..17
      @periodo = "Tarde"
      @total_tarde +=1 
      @tarde +=1
    when 18..23
      @periodo = "Noite" 
      @total_noite +=1
      @noite +=1
    else
      "Indefinido"
    end
  end

  def preencherArray
    if @arrayPeriodo.include?(@consulta.strftime("%d/%m/%Y")) == false
      @arrayPeriodo << @consulta.strftime("%d/%m/%Y") << @madrugada << @manha << @tarde << @noite
    else
      @arrayPeriodo.pop(5)
      @arrayPeriodo << @consulta.strftime("%d/%m/%Y") << @madrugada << @manha << @tarde << @noite            
    end
  end

  def ConsultarPeriodo
    @madrugada = 0
    @total_madrugada = 0
    @manha = 0
    @total_manha = 0
    @tarde = 0
    @total_tarde = 0
    @noite = 0
    @total_noite = 0
    @total_itens = 0
    @consulta_antiga = Time.current + 3600; #ConsultaAntiga incia no futuro.
    @arrayPeriodo = []

    periodo = Appointment.where("created_at >= ? and created_at <= ?", @beginning_of_period.beginning_of_day, Time.now).order('date(created_at)')

    periodo.each do |item|
      @total_itens += 1
      @consulta = item.created_at #+ (@total_itens * 3600);  
      if @consulta.to_date == @consulta_antiga.to_date
      else
        @madrugada = 0
        @manha = 0
        @tarde = 0
        @noite = 0
        @consulta_antiga = @consulta.to_date
      end
      regraPeriodoCase()
      preencherArray()
    end
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

    def set_period
      @last_period_length = params[:days].present? ? params[:days].to_i.abs : 0
      @beginning_of_period = @last_period_length != 0? (Time.now - (@last_period_length * 24 * 60 * 60)) : (Date.today - (@last_period_length * 24 * 60 * 60))
    end

    def appointments_per_disease
      Appointment.where("appointments.created_at >= ? and appointments.created_at <= ?", @beginning_of_period.to_date, Time.now).joins(:diseases).group('diseases.name').group('date(appointments.created_at)').count
    end

    def sex_per_last_period_title
      if @last_period_length == 0
        "do último dia"
      else
        "dos últimos #{@last_period_length} dias"
      end
    end

    def diseases_per_age
      Appointment.joins(:diseases).group('diseases.name').group('appointments.age').count
    end

    def sex_per_diseases
      Appointment.joins(:diseases).group('appointments.sex').group('diseases.name').count
    end

    def sex_distribution
      Appointment.group('sex').order('sex').count
    end
end
