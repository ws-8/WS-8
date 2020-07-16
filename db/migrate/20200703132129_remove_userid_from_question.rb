class RemoveUseridFromQuestion < ActiveRecord::Migration[5.1]
  def change
    remove_column :questions, :userid, :integer
  end
end
