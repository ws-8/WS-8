class AddUsertagToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :usertag, :integer, limit:1
  end
end
