class Appointment < ApplicationRecord
  has_and_belongs_to_many :diseases
  belongs_to :hospital, optional: true

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
    @@key_periods = %i[madrugada manha tarde noite]

    def with_diseases_at_least(n)
      Appointment.
        joins(:diseases).
        group("appointments.id").
        having("count(appointments_diseases.appointment_id) >= ?", [n])
    end

    def age_distribution
      Appointment.group(:age).count
    end

    def sex_per_last_period(beginning_of_period)
      err = ArgumentError.new "parameter must be a date prior to tomorrow"
      raise err if beginning_of_period > (Time.now + 1.day).beginning_of_day

      Appointment.
        where("created_at >= ? and created_at <= ?",
              beginning_of_period.beginning_of_day,
              Time.now).
        group('sex').
        order('sex').
        group('date(created_at)').
        order('date(created_at)').
        count
    end

    def appointments_per_disease(beginning_of_period)
      err = ArgumentError.new "parameter must be a date prior to tomorrow"
      raise err if beginning_of_period > (Time.now + 1.day).beginning_of_day

      Appointment.
        where("appointments.created_at >= ? and appointments.created_at <= ?",
              beginning_of_period.to_date,
              Time.now).
        joins(:diseases).
        group('diseases.name').
        group('date(appointments.created_at)').
        count
    end

    def diseases_per_age
      Appointment.
        joins(:diseases).
        group('diseases.name').
        group('appointments.age').
        count
    end

    def sex_per_diseases
      Appointment.
        joins(:diseases).
        group('appointments.sex').
        group('diseases.name').
        count
    end

    def sex_distribution
      Appointment.
        group('sex').
        order('sex').
        count
    end

    def appointments_per_day_period(beginning_of_period)
      err = ArgumentError.new "parameter must be a date prior to tomorrow"
      raise err if beginning_of_period > (Time.now + 1.day).beginning_of_day

      periods, totals, arrayPeriodo = {}, {}, []

      @@key_periods.each do |p|
        periods[p] = 0
        totals[p] = 0
      end

      # consulta_antiga inicia no futuro.
      consulta_antiga = Time.current + 3600

      appointments = Appointment.
        where("created_at >= ? and created_at <= ?",
              beginning_of_period.beginning_of_day,
              Time.now).
        order('date(created_at)')

      appointments.each do |appointment|
        app_timestamp = appointment.created_at

        unless app_timestamp.to_date == consulta_antiga.to_date
          consulta_antiga = app_timestamp.to_date

          @@key_periods.each { |p| periods[p] = 0 }
        end

        regraPeriodoCase(app_timestamp, periods, totals)

        arrayPeriodo = preencherArray(arrayPeriodo, app_timestamp, periods)
      end

      [arrayPeriodo, totals]
    end

    private

      def preencherArray(arrayPeriodo, app_timestamp, periods)
        arrayPeriodo.pop(5) if arrayPeriodo.
          include?(app_timestamp.strftime("%d/%m/%Y"))

        arrayPeriodo << app_timestamp.strftime("%d/%m/%Y")

        @@key_periods.each { |p| arrayPeriodo << periods[p] }

        arrayPeriodo
      end

      def regraPeriodoCase(app_timestamp, periods, totals)
        case app_timestamp.hour
        when 0..5
          totals[:madrugada] +=1
          periods[:madrugada] +=1
        when 6..11
          totals[:manha] +=1
          periods[:manha] +=1
        when 12..17
          totals[:tarde] +=1
          periods[:tarde] +=1
        when 18..23
          totals[:noite] +=1
          periods[:noite] +=1
        end
      end

  end

  private
    def format_params
      self.sex = sex.downcase.strip unless sex.nil?
    end
end
