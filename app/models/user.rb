class User < ApplicationRecord
  validates :name, :password
  validates :email, uniqueness: true
  has_many :categories
  has_many :ideas 
end