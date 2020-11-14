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
  end

  private
    def format_params
      self.sex = sex.downcase.strip unless sex.nil?
    end
end
