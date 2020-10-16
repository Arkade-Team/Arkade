class Disease < ApplicationRecord
  has_and_belongs_to_many :appointments

  validates :name,
    uniqueness: true,
    length: { minimum: 2 }

  def self.related_pairs
    hash = {}

    Appointment.with_diseases_at_least(2).each do |app|
      diseases_name = app.diseases.map{ |d| d.name }

      diseases_name.combination(2).each do |combination|
        first, second = combination[0], combination[1]

        hash[first] ||= { "#{second}" => 0 }
        hash[second] ||= { "#{first}" => 0 }

        value = hash[first][second]
        hash[first][second] = value.nil? ? 1 : value + 1

        value = hash[second][first]
        hash[second][first] = value.nil? ? 1 : value + 1
      end
    end

    hash
  end
end
