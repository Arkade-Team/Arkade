class Disease < ApplicationRecord
  has_and_belongs_to_many :appointments

  validates :name,
    uniqueness: true,
    length: { minimum: 2 }

  def self.related_pairs
    two_plus_disease_apps = Appointment.all.filter do |app|
      app.diseases.size >= 2
    end

    hash = {}

    two_plus_disease_apps.each do |app|
      diseases_name = app.diseases.map{ |d| d.name }

      diseases_name.each do |first|
        diseases_name.each do |second|
          unless first.eql? second
            hash[first] ||= { "#{second}" => 0 }

            value = hash[first][second]
            hash[first][second] = value.nil? ? 1 : value + 1
          end
        end
      end
    end

    hash
  end
end
