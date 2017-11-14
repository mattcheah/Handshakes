class Cause < ApplicationRecord
    has_many :causes, through: :user_causes
    has_many :user_causes
end
