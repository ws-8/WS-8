class AddHypAccountToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :hypaccount, :string
  end
end
