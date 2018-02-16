class Idea < ApplicationRecord
  validates :content, presence: true, uniqueness: { message: "This email already exists in our database!" }
  belongs_to :user
  belongs_to :category
  has_many :idea_images, dependent: :nullify
  has_many :images, through: :idea_images
end