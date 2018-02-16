# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
require './app/models/image'
# require './app/models/user'

Image.delete_all
User.delete_all

PICS = ["jt1.jpeg",
        "jt2.jpeg",
        "jt4.jpeg",
        "jt5.jpeg",
        "jt7.jpeg",
        "ilana.jpeg"
       ]

PICS.each do |pic|
  Image.create!(image_url: pic)
end

User.create!(name: "jeff", email: "jeff@turing.io", password: "password", role: 1)
User.create!(name: "elsa", email: "elsag", password: "password", role: 1)
User.create!(name: "lou", email: "loug", password: "pass", role: 0)
User.create!(name: "dan", email: "dang", password: "pass", role: 0)