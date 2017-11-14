class Skill < ApplicationRecord
    has_many :users, through: :users_skills
    has_many :users_skills
end