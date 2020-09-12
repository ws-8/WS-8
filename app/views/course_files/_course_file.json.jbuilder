json.extract! course_file, :id, :title, :filename, :comment, :created_at, :updated_at
json.url course_file_url(course_file, format: :json)
