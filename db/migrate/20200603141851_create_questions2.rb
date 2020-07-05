class CreateQuestions < ActiveRecord::Migration[5.1]
  def change
    create_table :questions do |t|
      t.string :title, limit: 100, null:false
      t.string :body, limit: 1000, null:false
      t.integer :metoo, null:false, default:0
      t.datetime :post_date
      t.integer :lessonid, null:false, foreign_key: true
      t.integer :userid, null:false, foreign_key: true

      t.timestamps
    end
  end
end
