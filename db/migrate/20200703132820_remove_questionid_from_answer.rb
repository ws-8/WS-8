class RemoveQuestionidFromAnswer < ActiveRecord::Migration[5.1]
  def change
    remove_column :answers, :questionid, :integer
  end
end
