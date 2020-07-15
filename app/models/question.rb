# frozen_string_literal: true

class Question < ApplicationRecord
  belongs_to :lesson
  belongs_to :user
  has_many :answers
  has_many:qmetoos,class_name: "Metoo"
  validates :title, presence: true
  validates :body, presence: true
  default_scope -> { order(created_at: :desc) }
end
