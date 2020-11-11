class Wiki < ApplicationRecord
  has_many :readingtimes

  validates :name, presence: true,
                   uniqueness: true,
                   length: { minimum: 2 }
end
