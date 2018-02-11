class Idea < ApplicationRecord
  validates :content, optional: true
  belong_to :category
  has_many :images
end