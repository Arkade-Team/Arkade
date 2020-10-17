class Disease < ApplicationRecord
  has_and_belongs_to_many :appointments
  has_many :actions, as: :actionable

  validates :name,
    uniqueness: true,
    length: { minimum: 2 }
end
