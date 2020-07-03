class RemoveClassidFromRegistration < ActiveRecord::Migration[5.1]
  def change
    remove_column :registrations, :classid, :integer
  end
end
