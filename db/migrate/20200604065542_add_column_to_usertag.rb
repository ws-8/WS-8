class AddColumnToUsertag < ActiveRecord::Migration[5.1]
  def change
    add_column :user, :user_tag, :integer, limit:1, null:false
  end
end
