class CreateJoinTableDiseasesActions < ActiveRecord::Migration[6.0]
  def change
    create_join_table :diseases, :actions do |t|
      # t.index [:disease_id, :action_id]
      # t.index [:action_id, :disease_id]
    end
  end
end
