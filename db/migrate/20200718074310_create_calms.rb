class CreateCalms < ActiveRecord::Migration[5.1]
  def change
    create_table :calms do |t|
      t.integer :calm_score
      t.references :scream
      t.references :answer

      t.timestamps
    end
  end
end
