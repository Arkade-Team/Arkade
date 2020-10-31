class CreateWikis < ActiveRecord::Migration[6.0]
  def change
    create_table :wikis do |t|
      t.string :name

      t.timestamps
    end
    create_table :tabs do |t|
      t.belongs_to :wiki
      t.string :title
      t.string :body

    end
    create_table :readingtimes do |t|
      t.belongs_to :wiki

      t.timestamps
    end

  end
end
