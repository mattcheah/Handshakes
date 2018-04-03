class Skill < ApplicationRecord
    has_many :user_skills, class_name: UserSkills
    has_many :users, through: :user_skills
    
    validates :name, presence: true, uniqueness: true
end