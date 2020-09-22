# frozen_string_literal: true

class Lesson < ApplicationRecord
  belongs_to :user
  belongs_to :course
  has_many :questions
  has_many :lesson_files
  has_many :bars
end
