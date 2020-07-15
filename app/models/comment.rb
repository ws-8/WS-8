class Comment < ApplicationRecord
  belongs_to:user
  belongs_to:answer
  has_many:cgoods

  validates :body, presence: true
end
