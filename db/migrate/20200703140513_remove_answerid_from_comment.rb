class RemoveAnsweridFromComment < ActiveRecord::Migration[5.1]
  def change
    remove_column :comments, :answerid, :integer
  end
end
