class Action < ApplicationRecord
    has_and_belongs_to_many :appointments
    has_and_belongs_to_many :diseases
    has_many :prescriptions

    enum method: [:questionary, :calculator]
end
