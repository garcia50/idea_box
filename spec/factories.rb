FactoryBot.define do
  factory :user do
    name "Jake"
    email "muffins@turing.com"
    password "pass"
  end

  factory :idea do
    content "Flying Muffins"
    user
    category
  end

  factory :category do
    title "Food"
  end

  factory :image do 
    image "dog"
    image_file_name
    image_content_type
    image_file_size
    image_update_at
  end

  factory :admin, class: User do 
    name "Sully"
    email "sully@turing.com"
    password "pass"
  end

end


# Factory bot- replace the line below with... 
# company = Company.create!(name: "ESPN")

# ...with this...
# company = create(:company)


# to make multiple object you can do:
#this will make three companies 
# company = create(:company, 3)

# If you want to make soething unique add the the sequence method
# factory :job do
#     title "Joe Black"
#     description "So much fun!"
#     level_of_interest 80
#     city "Denver"
#     sequence(:company) {|n| "Title #{n}" }
#     category
#   end
  