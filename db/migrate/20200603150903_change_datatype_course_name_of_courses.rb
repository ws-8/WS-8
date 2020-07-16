class ChangeDatatypeCourseNameOfCourses < ActiveRecord::Migration[5.1]
  def change
    change_column :courses, :course_name, :string, limit:100, null:false
  end
end
