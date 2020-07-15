class User < ApplicationRecord
  has_many :lessons_for_teacher,class_name:"Lesson",foreign_key:"user_id"
  has_many :questions
  has_many :registrations
  has_many :courses, through: :registrations
  has_many :metoos
  has_many :lessons, through: :registrations, through: :courses
  #user.lessonsを使用すると，warningが出ますが無視していただいて大丈夫です．
  #Lessonにもuser_idが存在するのですが，これは教師のidを示しています．
  #ここで取ってくるのは生徒のuser_idに対応したLessonになります．

  has_secure_password
    enum usertag:{
    teacher: 0, #先生
    ta: 1, #TA
    student: 2, #生徒
    admin: 3 #開発・保守専用
  }
end
