class Image < ApplicationRecord
  validates_presence_of :image_url
  has_many :ideas
end