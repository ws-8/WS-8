# frozen_string_literal: true

class Course < ApplicationRecord
  has_many :lessons
  has_many :registrations
  has_many :course_files
end
