require 'rails_helper'

describe "User can create an idea" do
  describe "a user creates an idea" do
    visit new_user_id_path

    expect(page).to have_content("If you can think it, save it before you forget!")
    
    fill_in "idea[:content]", with: "Flying cats!"

    click_on "Create Idea"

    expect(current_path).to eq(idea )
  end
end
