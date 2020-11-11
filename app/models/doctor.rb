class Doctor < ApplicationRecord
   validates :crm, presence: true, uniqueness: { case_sensitive: false }, length: { is: 10 }
   validates :name, presence: true, length: { in: 5..60 }
   validates :specialty, presence: true, length: { in: 5..60 }
end
