class Cause < ApplicationRecord
    has_many :user_causes, class_name: UserCauses
    has_many :causes, through: :user_causes
    
    validates :name, presence: true, uniqueness: true
end
