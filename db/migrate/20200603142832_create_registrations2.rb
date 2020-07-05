class CreateRegistrations < ActiveRecord::Migration[5.1]
  def change
    create_table :registrations do |t|
      t.integer :classid, null: false, foreign_key: true
      t.integer :userid, null: false, foreign_key: true

      t.timestamps
    end
  end
end
