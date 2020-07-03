class RemoveUseridFromLessons < ActiveRecord::Migration[5.1]
  def change
    remove_column :lessons, :userid, :integer
  end
end
