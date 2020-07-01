class AddEmailToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :email, :string, limit:256
  end
end
