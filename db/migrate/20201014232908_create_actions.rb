class CreateActions < ActiveRecord::Migration[6.0]
  def change
    create_table :actions do |t|
      t.string :name
      t.string :result
      t.integer :method
      t.references :appointment, foreign_key: true
      t.references :disease, foreign_key: true
      t.timestamps
    end
  end
end