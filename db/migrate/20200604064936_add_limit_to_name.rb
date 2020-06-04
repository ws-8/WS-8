class AddLimitToName < ActiveRecord::Migration[5.1]
  def change
    change_column_limit_null :user :name, false
    change_column_limit_null :user :password_digest, false
  end
end
