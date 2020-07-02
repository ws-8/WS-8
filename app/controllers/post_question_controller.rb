class PostQuestionController < ApplicationController
  def new
    @courses = Course.select("course_name")
    query = 'SELECT course_name, title FROM lessons, courses WHERE courses.id == lessons.classid'
    @lessons = Course.find_by_sql(query)
  end
end
