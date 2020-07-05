class AddCourseRefToRegistration < ActiveRecord::Migration[5.1]
  def change
    add_reference :registrations, :course, foreign_key: true
  end
end
