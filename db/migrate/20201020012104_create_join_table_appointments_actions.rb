class CreateJoinTableAppointmentsActions < ActiveRecord::Migration[6.0]
  def change
    create_join_table :appointments, :actions do |t|
      # t.index [:appointment_id, :action_id]
      # t.index [:action_id, :appointment_id]
    end
  end
end