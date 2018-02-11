require 'rails_helper'

describe User, type: :model do
  describe "validations" do
    it "is invalid without a name" do
      user = User.new(email: "me@you.com", password_digest: "youandme")

      expect(user).to be_invalid
    end

    it "is invalid without a email" do
      user = User.new(name: "Jake", password_digest: "youandme")

      expect(user).to be_invalid
    end

    it "is invalid without a password" do
      user = User.new(name: "Jake", email: "you@me.com")

      expect(user).to be_invalid
    end

    it "is valid with a name" do
      user = create(:user)

      expect(user).to be_valid
    end

    it "is valid with a email" do
      user = create(:user)

      expect(user).to be_valid
    end

    it "is valid with a password" do
      user = create(:user)

      expect(user).to be_valid
    end

    it "presence of name" do
      user = User.new(email: "get@me.com", password: "Password")

      expect(user).to_not be_valid
    end
    
    it "uniqueness of email" do
      orig = User.create(name: "user", email: "you@me.com", password: "Password")
      copy = User.new(name: "user", email: "you@me.com", password: "Password")

      expect(copy).to_not be_valid
    end
  end
end