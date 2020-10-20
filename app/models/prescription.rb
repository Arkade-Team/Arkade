class Prescription < ApplicationRecord
  belongs_to :appointment
  belongs_to :disease
  belongs_to :action
end
