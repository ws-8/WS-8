class Agood < ApplicationRecord
    belongs_to :answer
    belongs_to :user
    validates_uniqueness_of :user_id, scope: :answer_id
end
