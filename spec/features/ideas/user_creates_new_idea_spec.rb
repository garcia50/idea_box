require 'rails_helper'

describe "User can create an idea" do
  scenario "a user creates an idea" do
    user = create(:user)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit new_user_idea_path(user)

    expect(page).to have_content("If you can think it, save it before you forget!")
    
    fill_in "idea[content]", with: "Flying cats!"

    click_on "Create Idea"

    expect(current_path).to eq(user_ideas_path(user))
  end
end
