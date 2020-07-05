class CreateComments < ActiveRecord::Migration[5.1]
  def change
    create_table :comments do |t|
      t.string :body, limit: 1000, null:false
      t.integer :score, default: 0
      t.datetime :post_date
      t.integer :answerid, null: false, foreign_key: true
      t.integer :userid, null: false, foreign_key: true

      t.timestamps
    end
  end
end
