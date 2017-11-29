class Skill < ApplicationRecord
    has_many :user_skill
    has_many :users, through: :user_skill
    
    validates :name, presence: true, uniqueness: true
end