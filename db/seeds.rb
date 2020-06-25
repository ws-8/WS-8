# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require "csv"

CSV.foreach('db/testdata_for_user.csv') do |row|
 User.create(:name => row[0], :password => row[1], :usertag => row[2].to_i)
end

CSV.foreach('db/course.csv') do |row|
  Course.create(:course_name => row[0], :post_date => row[1])
end