class RemoveClassidFromLessons < ActiveRecord::Migration[5.1]
  def change
    remove_column :lessons, :classid, :integer
  end
end
