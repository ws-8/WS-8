class CreateCourses < ActiveRecord::Migration[5.1]
  def change
    create_table :courses do |t|
      t.string :course_name
      t.datetime :post_date

      t.timestamps
    end
  end
end
