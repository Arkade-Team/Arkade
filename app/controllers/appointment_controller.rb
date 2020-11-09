class AppointmentController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:create]

  def index 
    @appointments = Appointment.all
    @daysAgo = params[:days].present? ? params[:days].to_i.abs : 15
    @fifteenDaysAgo = @daysAgo != 0? (Time.now - (@daysAgo * 24 * 60 * 60)) : (Date.today - (@daysAgo * 24 * 60 * 60))
    @lastFifteenDays = Appointment.where("created_at >= ? and created_at <= ?", @fifteenDaysAgo.beginning_of_day, Time.now).group('sex').order('sex').group('date(created_at)').order('date(created_at)').count
    @sex = Appointment.group('sex').order('sex').count
    @lastFifteenDaysPeriodo = Appointment.where("created_at >= ? and created_at <= ?", @fifteenDaysAgo.beginning_of_day, Time.now).order('date(created_at)')

    @diseasesByAge = Appointment.joins(:diseases).group('diseases.name').group('appointments.age').count
    @sexByDiseases = Appointment.joins(:diseases).group('appointments.sex').group('diseases.name').count
    ConsultarPeriodo()
    @consultsDiseasesHistory = Appointment.where("appointments.created_at >= ? and appointments.created_at <= ?", @fifteenDaysAgo.to_date, Time.now).joins(:diseases).group('diseases.name').group('date(appointments.created_at)').count
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

    @lastFifteenDaysPeriodo.each do |item|         
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
end