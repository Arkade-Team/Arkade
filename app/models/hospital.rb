class Hospital < ApplicationRecord
    has_many :appointments

    validates :name,
    uniqueness: true,
    length: { minimum: 3 }

end
