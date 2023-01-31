require 'rails_helper'

RSpec.describe User, type: :model do
  describe "Validations" do
    before do
      @user = User.new(first_name: 'John', last_name: 'Doe', email: 'test@test.com', password: 'password', password_confirmation: 'password')
    end

    it "should have matching password and password_confirmation" do
      @user.password_confirmation = 'diffpassword'
      expect(@user).to_not be_valid
    end

    it "should require a password and password_confirmation" do
      @user.password = nil
      @user.password_confirmation = nil
      expect(@user).to_not be_valid
    end

    it "should require a unique case insensitive email" do
      @user.save
      user_with_same_email = User.new(first_name: 'Jane', last_name: 'Doe', email: 'TEST@TEST.com', password: 'password', password_confirmation: 'password')
      expect(user_with_same_email).to_not be_valid
    end

    it "should require an email, first name, and last name" do
      @user.email = nil
      @user.first_name = nil
      @user.last_name = nil
      expect(@user).to_not be_valid
    end
  end

  describe ".authenticate_with_credentials" do
    before do
      @user = User.create(first_name: 'John', last_name: 'Doe', email: 'test@test.com', password: 'password', password_confirmation: 'password')  
    end

    it "should return the user if credentials are correct" do
      expect(User.authenticate_with_credentials('test@test.com', 'password')).to eq(@user)
    end

    it "should return nil if email does not match" do
      expect(User.authenticate_with_credentials('fail@fail.com', 'password')).to eq(nil)
    end

    it "should return nil if password does not match" do
      expect(User.authenticate_with_credentials('test@test.com', 'wrongpassword')).to eq(nil)
    end

    it "should ignore trailing spaces before or after the email" do
      expect(User.authenticate_with_credentials(' test@test.com  ', 'password')).to eq(@user)
    end

    it "should ignore case sensitivity for email" do
      expect(User.authenticate_with_credentials('TEST@test.com', 'password')).to eq(@user)
    end
  end
end
