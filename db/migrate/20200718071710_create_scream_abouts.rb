class CreateScreamAbouts < ActiveRecord::Migration[5.1]
  def change
    create_table :scream_abouts do |t|
      t.integer rided_score, nil: false, default: 0
      t.references :scream, foreign_key: true, nil: false
      t.references :question, foreign_key: true, nil: false

      t.timestamps
    end
  end
end
