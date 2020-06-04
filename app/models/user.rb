class User < ApplicationRecord
   has_secure_password
   enum user_tag:{
     teacher: 0, #先生
     ta: 1, #TA
     student: 2, #生徒
     admin: 3, #開発・保守専用
   }

end
