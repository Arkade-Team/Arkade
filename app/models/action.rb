class Action < ApplicationRecord
    belongs_to :appointment

    enum method: [:questionary, :calculator]
end
