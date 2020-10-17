class Appointment < ApplicationRecord
  has_and_belongs_to_many :diseases
  has_many :actions, as: :actionable

  validates :age, presence: true,
    numericality: {
      only_integer: true,
      greater_than_or_equal_to: 0,
      less_than: 130
    }

  validates :sex, presence: true,
    format: { with: /\A(male|female)\z/ }

  before_validation :format_params

  def self.with_diseases_at_least(n)
    Appointment.joins(:diseases).group("appointments.id").having("count(appointments_diseases.appointment_id) >= ?", [n])
  end

  private
    def format_params
      self.sex = sex.downcase.strip unless sex.nil?
    end
end
