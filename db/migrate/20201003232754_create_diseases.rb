class CreateDiseases < ActiveRecord::Migration[6.0]
  def change
    create_table :diseases do |t|
      t.string :name

      t.timestamps
    end

    create_table :appointments_diseases, id: false do |t|
      t.belongs_to :appointment
      t.belongs_to :disease
    end
  end
end