class RemovePostdateFromAnswers < ActiveRecord::Migration[5.1]
  def change
    remove_column :answers, :post_date, :datetime
  end
end
