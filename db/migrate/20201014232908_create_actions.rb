class CreateActions < ActiveRecord::Migration[6.0]
  def change
    create_table :actions do |t|
      t.string :name
      t.string :result
      t.integer :method
      t.references :actionable 

      t.timestamps
    end
  end
end
