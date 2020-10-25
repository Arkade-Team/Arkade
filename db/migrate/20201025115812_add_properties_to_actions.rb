class AddPropertiesToActions < ActiveRecord::Migration[6.0]
  def change
    add_column :appointments_diseases, :id, :primary_key
    add_column :appointments_diseases, :name, :string
    add_column :appointments_diseases, :result, :string
  end
end
