class User < ApplicationRecord
  validates :name, presence: true 
  validates :email, presence: true, uniqueness: true
  validates :password_digest, presence: true
  has_many :categories
  has_many :ideas 
end