class User < ApplicationRecord
  has_secure_password
  validates :name, presence: true 
  validates :email, presence: true, uniqueness: { message: "This email already exists in our database!" }
  validates :password_digest, presence: true
  has_many :categories
  has_many :ideas 
end