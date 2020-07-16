class RemovePostdateFromCourses < ActiveRecord::Migration[5.1]
  def change
    remove_column :courses, :post_date, :datetime
  end
end
