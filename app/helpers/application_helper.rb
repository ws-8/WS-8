module ApplicationHelper
    def get_lectures
    # get courses and lessons
        @courses = Course.select("course_name")
        query = 'SELECT course_name, title FROM lessons, courses WHERE courses.id == lessons.course_id'
        @lessons = Course.find_by_sql(query)
    end
end
