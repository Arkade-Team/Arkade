class Appointment < ApplicationRecord
  has_and_belongs_to_many :diseases

  validates :age, presence: true,
    numericality: {
      only_integer: true,
      greater_than_or_equal_to: 0,
      less_than: 130
    }

  validates :sex, presence: true,
    format: { with: /\A(male|female)\z/ }

  before_validation :format_params

  class << self
    def with_diseases_at_least(n)
      Appointment.joins(:diseases).group("appointments.id").having("count(appointments_diseases.appointment_id) >= ?", [n])
    end

    def age_distribution
      Appointment.group(:age).count
    end

    def sex_per_last_period(beginning_of_period)
      err = ArgumentError.new "parameter must be a date prior to tomorrow"
      raise err if beginning_of_period > (Time.now + 1.day).beginning_of_day

      Appointment.where("created_at >= ? and created_at <= ?", beginning_of_period.beginning_of_day, Time.now).group('sex').order('sex').group('date(created_at)').order('date(created_at)').count
    end

    def appointments_per_disease(beginning_of_period)
      err = ArgumentError.new "parameter must be a date prior to tomorrow"
      raise err if beginning_of_period > (Time.now + 1.day).beginning_of_day

      Appointment.where("appointments.created_at >= ? and appointments.created_at <= ?", beginning_of_period.to_date, Time.now).joins(:diseases).group('diseases.name').group('date(appointments.created_at)').count
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

    def appointments_per_day_period(beginning_of_period)
      err = ArgumentError.new "parameter must be a date prior to tomorrow"
      raise err if beginning_of_period > (Time.now + 1.day).beginning_of_day

      madrugada, total_madrugada, manha, total_manha,
       tarde, total_tarde, noite, total_noite = [0] * 8

      consulta_antiga = Time.current + 3600; #ConsultaAntiga incia no futuro.
      arrayPeriodo = []

      periodo = Appointment.where("created_at >= ? and created_at <= ?", beginning_of_period.beginning_of_day, Time.now).order('date(created_at)')

      periodo.each do |item|
        consulta = item.created_at #+ (@total_itens * 3600);
        unless consulta.to_date == consulta_antiga.to_date
          madrugada = 0
          manha = 0
          tarde = 0
          noite = 0
          consulta_antiga = consulta.to_date
        end

        madrugada, total_madrugada, manha, total_manha,
         tarde, total_tarde, noite, total_noite =
          regraPeriodoCase(
            consulta, madrugada, total_madrugada, manha, total_manha,
            tarde, total_tarde, noite, total_noite
          )

        arrayPeriodo = preencherArray arrayPeriodo, consulta, madrugada, manha, tarde, noite
      end

      [arrayPeriodo, total_madrugada, total_manha, total_tarde, total_noite]
    end

    private

      def preencherArray(arrayPeriodo, consulta, madrugada, manha, tarde, noite)
        if arrayPeriodo.include?(consulta.strftime("%d/%m/%Y"))
          arrayPeriodo.pop(5)
          arrayPeriodo << consulta.strftime("%d/%m/%Y") << madrugada << manha << tarde << noite
        else
          arrayPeriodo << consulta.strftime("%d/%m/%Y") << madrugada << manha << tarde << noite
        end

        arrayPeriodo
      end

      def regraPeriodoCase(consulta, madrugada, total_madrugada, manha, total_manha, tarde, total_tarde, noite, total_noite)
        case consulta.hour
        when 0..5
          total_madrugada +=1
          madrugada +=1
        when 6..11
          total_manha +=1
          manha +=1
        when 12..17
          total_tarde +=1
          tarde +=1
        when 18..23
          total_noite +=1
          noite +=1
        end

        [madrugada, total_madrugada, manha, total_manha, tarde, total_tarde, noite, total_noite]
      end

  end

  private
    def format_params
      self.sex = sex.downcase.strip unless sex.nil?
    end
end
