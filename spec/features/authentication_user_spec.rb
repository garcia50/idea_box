require 'rails_helper'

describe "As an unathenticted use" do
  describe "when I visit the landing page I see a create a new user link" do
    scenario "when I click on the link I can create an account" do
      visit '/'

      click_on 'Sign Up To Be A User'

      expect(current_path).to eq(new_user_path)
      expect(page).to have_content("Create a user here") 


      fill_in "user[name]", with: "Ed"
      fill_in "user[email]", with: "muf@fin.com"
      fill_in "user[password_digest]", with: "muffin"

      click_on "Create User"

      expect(current_path).to eq(user_path(User.last.id))   
      expect(page).to have_content("Welcome Ed") 
    end
  end
end
