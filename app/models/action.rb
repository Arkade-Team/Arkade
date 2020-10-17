class Action < ApplicationRecord
    belongs_to :actionable

    enum method: [:questionary, :calculator]
end
