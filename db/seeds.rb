# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require "csv"

CSV.foreach('db/user.csv') do |row|
  User.create(:name => row[0], :password => row[1], :usertag => row[2].to_i, :email=> row[3])
end

CSV.foreach('db/course.csv') do |row|
  Course.create(:course_name => row[0])
end

CSV.foreach('db/registration.csv') do |row|
  Registration.create(:classid => row[0],:userid => row[1])
end

CSV.foreach('db/lesson.csv') do |row|
  Lesson.create(:title => row[0],:body => row[1],:file_path => row[2],:classid => row[3],:userid => row[4])
end

CSV.foreach('db/question.csv') do |row|
  Question.create(:title => row[0],:body => row[1],:metoo => row[2],:solved=> row[3],:lessonid => row[4],:userid => row[5])
end

CSV.foreach('db/answer.csv') do |row|
  Answer.create(:body => row[0],:score => row[1],:authorized => row[2], :questionid => row[3],:userid => row[4])
end

CSV.foreach('db/comment.csv') do |row|
  Comment.create(:body => row[0],:score => row[1], :answerid => row[2],:userid => row[3])
end
