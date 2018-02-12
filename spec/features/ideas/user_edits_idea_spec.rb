require 'rails_helper'

describe "User can edit an idea" do
  scenario "a user edits an idea" do
    user = create(:user)
    category = create(:category)
    idea = create(:idea, user: user, category: category)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit edit_idea_path(idea)

    expect(page).to have_content("That was a dumb idea anyways...")

    fill_in "idea[content]", with: "Eating Muffins"

    click_on "Update Idea"

    expect(current_path).to eq(user_ideas_path(user))
    expect(page).to have_content("Eating Muffins")

  end
end
