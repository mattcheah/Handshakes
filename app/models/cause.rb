class Cause < ApplicationRecord
    has_many :causes, through: :users_causes
    has_many :users_causes
end
