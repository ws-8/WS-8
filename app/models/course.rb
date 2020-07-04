class Course < ApplicationRecord
  has_many:lessons
  has_many:registrations
end
