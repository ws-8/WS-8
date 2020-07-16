class RemoveUseridFromRegistration < ActiveRecord::Migration[5.1]
  def change
    remove_column :registrations, :userid, :integer
  end
end
