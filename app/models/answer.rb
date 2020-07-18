class Answer < ApplicationRecord
  belongs_to:question
  belongs_to:user
  has_many:comments
  has_many:agoods
  has_many:calms
  default_scope -> { order(created_at: :desc) }
  
  validates :body, presence: true
end
