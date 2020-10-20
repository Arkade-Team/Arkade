class Disease < ApplicationRecord
  has_and_belongs_to_many :appointments
  has_and_belongs_to_many :actions
  has_many :prescriptions

  validates :name,
    uniqueness: true,
    length: { minimum: 2 }

  def self.related_pairs
    counts = {}

    Appointment.with_diseases_at_least(2).each do |app|
      diseases_name = app.diseases.map{ |d| d.name }

      diseases_name.combination(2).each do |combination|
        first, second = combination[0], combination[1]

        Disease.increment_count first, second, counts
        Disease.increment_count second, first, counts
      end
    end

    counts
  end

  private

  def self.increment_count(fst, snd, count)
    count[fst] ||= { "#{snd}" => 0 }
    count[fst][snd] = count[fst][snd].nil? ? 1 : count[fst][snd] + 1
  end
end