class AddCalmScoreSumToAnswers < ActiveRecord::Migration[5.1]
  def change
    add_column :answers, :calm_score_sum, :integer, null: false, default: 0
  end
end
