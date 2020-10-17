class Appointment < ApplicationRecord
  has_and_belongs_to_many :diseases
  has_many :actions

  validates :age, presence: true,
    numericality: {
      only_integer: true,
      greater_than_or_equal_to: 0,
      less_than: 130
    }

  validates :sex, presence: true,
    format: { with: /\A(male|female)\z/ }

  before_validation :format_params

  private
    def format_params
      self.sex = sex.downcase.strip unless sex.nil?
    end
end
