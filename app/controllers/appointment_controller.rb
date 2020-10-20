class AppointmentController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:create]

  def index 
    @appointments = Appointment.all
    @daysAgo = 15
    @fifteenDaysAgo = Time.now - (@daysAgo * 24 * 60 * 60)
    @lastFifteenDays = Appointment.where("created_at >= ?", @fifteenDaysAgo ).group('sex').order('sex').group('date(created_at)').order('date(created_at)').count
    
    ###Consultas por período###
    @lastFifteenDaysPeriodo = Appointment.where("created_at >= ?", @fifteenDaysAgo ).group('date(created_at), id').order('date(created_at)')
       
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
            #adicionando 1h
            @consulta = item.created_at + (@total_itens * 3600);  
            if @consulta.to_date == @consulta_antiga.to_date
              regraPeriodo() #setando periodo e total periodo
            else
              @madrugada = 0
              @manha = 0
              @tarde = 0
              @noite = 0
              @consulta_antiga = @consulta.to_date
              regraPeriodo() #setando periodo e total periodo
            end
            
            if @arrayPeriodo.include?(@consulta.strftime("%d/%m/%Y")) == false
              @arrayPeriodo << @consulta.strftime("%d/%m/%Y") << @madrugada << @manha << @tarde << @noite
            else
              @arrayPeriodo.pop(5)
              @arrayPeriodo << @consulta.strftime("%d/%m/%Y") << @madrugada << @manha << @tarde << @noite            
            end
        end #end item
  end #index

  def regraPeriodo
    #Regra divisão período
    if @consulta.hour >=0 && @consulta.hour < 6
      @periodo = "Madrugada"
      @total_madrugada +=1
      @madrugada +=1 
    elsif  @consulta.hour >=6 && @consulta.hour < 12
      @periodo = "Manhã" 
      @total_manha +=1
      @manha +=1 
    elsif  @consulta.hour >=12 && @consulta.hour < 18
      @periodo = "Tarde"
      @total_tarde +=1 
      @tarde +=1
    else  @consulta.hour >=18 && @consulta.hour <= 23
      @periodo = "Noite" 
      @total_noite +=1
      @noite +=1
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
