class CreateLessonFiles < ActiveRecord::Migration[5.1]
  def change
    create_table :lesson_files do |t|
      t.string :title
      t.string :filename
      t.string :comment

      t.timestamps
    end
  end
end
