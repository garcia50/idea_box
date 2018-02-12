class Idea < ApplicationRecord
  validates :content, presence: true
  belongs_to :user
  belongs_to :category
  has_many :images
end