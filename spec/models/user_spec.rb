require 'rails_helper'

describe User do
  describe "validations" do
    it "is invalid without a name" do
      user = User.new

      expect(user).to be_invalid
    end
  end

end