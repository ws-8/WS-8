class AddUserRefToRegistration < ActiveRecord::Migration[5.1]
  def change
    add_reference :registrations, :user, foreign_key: true
  end
end
