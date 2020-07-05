class AddAnswerRefToComment < ActiveRecord::Migration[5.1]
  def change
    add_reference :comments, :answer, foreign_key: true
  end
end
