require 'rails_helper'

describe Idea do
  describe "relationships" do
    it "belongs to a users" do
      user = create(:user)
      category = create(:category)
      idea = create(:idea, user: user, category: category)

      expect(idea).to respond_to(:user)
      expect(idea.user).to eq(user)
    end
  end

end