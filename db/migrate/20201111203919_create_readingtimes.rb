class CreateReadingtimes < ActiveRecord::Migration[6.0]
  def change
    create_table :readingtimes do |t|
      t.references :wiki, null: false, foreign_key: true

      t.timestamps
    end
  end
end
