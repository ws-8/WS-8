class AddRidedScoreSumToQuestions < ActiveRecord::Migration[5.1]
  def change
    add_column :questions, :rided_score_sum, :integer, null: false, default: 0
  end
end
