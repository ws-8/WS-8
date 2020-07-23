class Scream < ApplicationRecord
    belongs_to :bar
    has_many :scream_abouts
    has_many :calms

end
