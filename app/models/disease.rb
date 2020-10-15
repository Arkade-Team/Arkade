class Disease < ApplicationRecord
  has_and_belongs_to_many :appointments

  validates :name,
    uniqueness: true,
    length: { minimum: 2 }

  def self.related_pairs
    {"Osteoporose" => { "Depressão" => 1 }}
  end
end
