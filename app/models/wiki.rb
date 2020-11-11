class Wiki < ApplicationRecord
  has_many :readingtimes

  validates :name, presence: true,
                   uniqueness: true,
                   length: { minimum: 2 }

  def self.with_readings_of(id)
    begin
      wiki = Wiki.find(id)
    rescue
      return nil
    end

    {
      name: wiki.name,
      readings: [1]
    }
  end
end
