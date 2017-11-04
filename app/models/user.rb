class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable
         
  validates_confirmation_of :password
  validates :password, length: { in: 6..200 }
  validates :first, :last, length: { in: 1..24 }
  validates :first, :last, :email, presence: true
  validates :email, uniqueness: true, length: { minimum: 3} 
  
end
