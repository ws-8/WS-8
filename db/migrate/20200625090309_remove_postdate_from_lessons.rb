class RemovePostdateFromLessons < ActiveRecord::Migration[5.1]
  def change
    remove_column :lessons, :post_date, :datetime
  end
end
