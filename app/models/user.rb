class User < ApplicationRecord
   has_secure_password
   enum usertag:{
   teacher: 0, #先生
   ta: 1, #TA
   student: 2, #生徒
   admin: 3 #開発・保守専用
   }

   # 渡された文字列のハッシュ値を返す
  def User.digest(string)
   cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                 BCrypt::Engine.cost
   BCrypt::Password.create(string, cost: cost)
 end
end
