# frozen_string_literal: true

class CreateLessonFiles < ActiveRecord::Migration[5.1]
  def change
    create_table :lesson_files do |t|
      t.string :title
      t.string :filename
      t.string :comment
      t.references :lesson, foreign_key: true, null: false

      t.timestamps
    end
    add_index :lesson_files, %i[lesson_id created_at]
  end
end
