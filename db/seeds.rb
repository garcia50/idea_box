# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
require './app/models/image'


PICS = ["https://s3.amazonaws.com/backpackersverse/wp-content/uploads/2016/07/20101209/Doll-Enjoys-Burning-Her-Victims-Alive.jpg",
        "http://buzzvital.com/wp-content/uploads/-000//1/desktop-1429122811.jpg",
        "https://s3.amazonaws.com/backpackersverse/wp-content/uploads/2016/07/20100018/Ventriloquist-Doll-Speaks-In-Demonic-Tongues.jpg",
        "https://i.ebayimg.com/thumbs/images/g/vTAAAOSwsZJaZOzh/s-l225.jpg",
        "https://s-media-cache-ak0.pinimg.com/236x/a2/c1/c1/a2c1c1fd816c761a07dfe1c9e1c78e4c--creepy-dolls-siamese.jpg"
       ]

PICS.each do |pic|
  Image.create!(image_url: pic)
end