class Skill < ApplicationRecord
    has_many :users, through: :users_skills
    has_many :users_skills
    
    validates :name, presence: true, uniqueness: true
end