json.extract! lesson_file, :id, :title, :filename, :comment, :created_at, :updated_at
json.url lesson_file_url(lesson_file, format: :json)
