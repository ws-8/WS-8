class RemoveUseridFromAnswer < ActiveRecord::Migration[5.1]
  def change
    remove_column :answers, :userid, :integer
  end
end
