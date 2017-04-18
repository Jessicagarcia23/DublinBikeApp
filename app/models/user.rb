class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
def password_digest
    self.encrypted_password
end
 
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  #relationship between User and Bookings, an user can have many bookings
  has_many :orders
  #This part of code will vidate the information, email and password
  before_save { self.email = email.downcase }
  attr_accessor :password
  validates :name, presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
        format: { with: VALID_EMAIL_REGEX},
        uniqueness: true, case_sensitive: false
  has_secure_password
  validates :password, length: { minimum: 6 }
  has_one :profile
end