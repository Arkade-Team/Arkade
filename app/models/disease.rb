class Disease < ApplicationRecord
  has_and_belongs_to_many :appointments

  validates :name,
    uniqueness: true,
    length: { minimum: 2 }

  def self.related_pairs
    two_disease_apps = Appointment.all.filter do |app|
      app.diseases.size == 2
    end

    hash = {}

    two_disease_apps.each do |app|
      diseases_name = app.diseases.map{ |d| d.name }.sort

      hash[diseases_name[0]] ||= { diseases_name[1] => 0 }
      hash[diseases_name[0]][diseases_name[1]] += 1
    end

    hash
  end
end
