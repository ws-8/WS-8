class AddAuthorizeToAnswer < ActiveRecord::Migration[5.1]
  def change
    add_column :answers, :authorized, :boolean, default:false,null:false
  end
end
