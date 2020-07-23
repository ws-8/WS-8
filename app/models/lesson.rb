class Lesson < ApplicationRecord
  belongs_to :user
  belongs_to:course
  has_many:questions
  has_many :bars
end
