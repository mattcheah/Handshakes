class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  
  has_many :users_causes 
  has_many :causes, through: :users_causes
  
  has_many :user_skill
  has_many :skills, through: :user_skill
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable
         
  serialize :skills, Array
  serialize :currentProjects, Array
  serialize :favoriteNpos, Array
  serialize :favoriteBusinesses, Array
  serialize :applications, Array
  serialize :reviews, Array
         
  validates_confirmation_of :password, on: :create
  validates :password, length: { in: 6..200 }, on: :create
  validates :first, :last, length: { maximum: 24 }
  validates :first, :last, :email, presence: true
  validates :email, uniqueness: true, length: { minimum: 3} 
  
end
