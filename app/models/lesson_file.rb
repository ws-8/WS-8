# frozen_string_literal: true

class LessonFile < ApplicationRecord
  attr_accessor :file
  belongs_to :lesson
end
