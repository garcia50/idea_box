require 'rails_helper'

describe Idea do
  describe "relationships" do
    it "belongs to a category" do
      idea = create!(:idea)

      expect(idea).to respond_to(category)
    end
  end

end