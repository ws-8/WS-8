class RemovePostdateFromComments < ActiveRecord::Migration[5.1]
  def change
    remove_column :comments, :post_date, :datetime
  end
end
