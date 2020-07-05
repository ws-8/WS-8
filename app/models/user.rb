class User < ApplicationRecord
  has_many :lessons_for_teacher,class_name:"Lesson",foreign_key:"user_id"
  has_many :questions
  has_many:registrations
  has_many:courses,through: :registrations
  has_many:lessons,through: :registrations,through: :courses
  #has_many:questions,through: :registrations,through: :courses,through: :lessons

   has_secure_password
   enum usertag:{
   teacher: 0, #先生
   ta: 1, #TA
   student: 2, #生徒
   admin: 3 #開発・保守専用
   }
end
