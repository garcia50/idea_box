class Idea < ApplicationRecord
  validates :content, presence: true, uniqueness: { message: "This email already exists in our database!" }
  belongs_to :user
  belongs_to :category
  has_many :images
end