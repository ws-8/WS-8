class CreateLessons < ActiveRecord::Migration[5.1]
  def change
    create_table :lessons do |t|
      t.string :title, limit: 100
      t.string :body, limit: 1000
      t.string :file_path, limit: 2083
      t.datetime :post_date
      t.integer :classid, foreign_key: true
      t.integer :userid, foreign_key: true

      t.timestamps
    end
  end
end
