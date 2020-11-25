class AddHospitalToAppointments < ActiveRecord::Migration[6.0]
  def change
    add_reference :appointments, :hospital, foreign_key: true
  end
end
