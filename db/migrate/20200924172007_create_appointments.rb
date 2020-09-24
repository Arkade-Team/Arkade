class CreateAppointments < ActiveRecord::Migration[6.0]
  def change
    create_table :appointments do |t|
      t.integer :age
      t.string :sex

      t.timestamps
    end
  end
end
