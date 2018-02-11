require 'rails_helper'

describe "As an unathenticted use" do
  describe "when I visit the landing page I see a create a new user link" do
    scenario "when I click on the link I can create an account" do
      visit root_path

      click_on 'Register'

      expect(current_path).to eq(new_user_path)
      expect(page).to have_content("Create a user here") 


      fill_in "user[name]", with: "Ed"
      fill_in "user[email]", with: "muf@fin.com"
      fill_in "user[password]", with: "muffin"

      click_on "Create User"

      expect(current_path).to eq(user_path(User.last.id))   
      expect(page).to have_content("Welcome Ed") 
    end
  end

  describe "when a user signs up with an existing account" do
    scenario "the user is redirected to the new_path with a prompt to enter a new username" do 
      visit new_user_path

      User.create!(name: "luisg", email: "woot", password: "test")

      fill_in "user[name]", with: "luisg"
      fill_in "user[email]", with: "woot"
      fill_in "user[password]", with: "test"

      click_on "Create User"

      expect(page).to have_content("This email already exists in our database!")
    end
  end

  describe "As an athenticated user" do 
    describe "when I visit homepage I see a sign in link" do
      scenario "when I click on the link I can access the existing users account" do
        user = User.create!(name: "luisg", email: "woot", password: "test")

        visit root_path

        click_on 'Sign In'

        expect(current_path).to eq(login_path)
        
        fill_in "name", with: user.name
        fill_in "email", with: user.email
        fill_in "password", with: user.password

        click_on "Log In"

        expect(current_path).to eq(user_path(user))

        expect(page).to have_content("Welcome, #{user.name}!")
        # expect(page).to have_content("Logout")
      end  
    end
  end 

end



















