class AddLessonRefToQuestion < ActiveRecord::Migration[5.1]
  def change
    add_reference :questions, :lesson, foreign_key: true
  end
end
