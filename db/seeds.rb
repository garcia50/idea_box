# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
IMAGES = ["Pet Spa", "PETA", "Columbus Zoo", "Pet Walk", "CarPet Repair", "Goat Yoga", "Doggy Daycare", "Pets'R'Us", "Pet Savvy", "Dog Fit"]


IMAGES.each_with_index do |image|
  image = Image.create!(name: name)
  category = Category.create!(title: CATEGORIES[i])
  puts "Created #{company.name}"
  10.times do |num|
    company.jobs.create!(title: JOBS[num], description: "What a great position!", level_of_interest: num + rand(100), city: CITIES.sample, category: category)
    puts "  Created #{company.jobs[num].title}"
  end
end
