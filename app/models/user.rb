class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  
  has_many :users_causes
  has_many :causes, through: :users_causes
  has_many :users_skills
  has_many :skills, through: :users_skills
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable
         
  serialize :skills, Array
  serialize :currentProjects, Array
  serialize :favoriteNpos, Array
  serialize :favoriteBusinesses, Array
  serialize :applications, Array
         
  validates_confirmation_of :password, on: :create
  validates :password, length: { in: 6..200 }, on: :create
  validates :first, :last, length: { maximum: 24 }
  validates :first, :last, :email, presence: true
  validates :email, uniqueness: true, length: { minimum: 3} 
  
end
