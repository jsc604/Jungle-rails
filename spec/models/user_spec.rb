require 'rails_helper'

RSpec.describe User, type: :model do
  describe "Validations" do
    before do
      @user = User.new(email: 'test@test.com', first_name: 'John', last_name: 'Doe', password: 'password', password_confirmation: 'password')
    end

    it "should have a matching password and password_confirmation" do
      @user.password_confirmation = 'notmatching'
      expect(@user).to_not be_valid
    end

    it "should require a password and password_confirmation when creating" do
      @user.password = nil
      @user.password_confirmation = nil
      expect(@user).to_not be_valid
    end

    it "should require a unique (case insensitive) email" do
      @user.save
      user_with_same_email = User.new(email: 'TEST@TEST.com', first_name: 'Jane', last_name: 'Doe', password: 'password', password_confirmation: 'password')
      expect(user_with_same_email).to_not be_valid
    end

    it "should require an email, first name, and last name" do
      @user.email = nil
      @user.first_name = nil
      @user.last_name = nil
      expect(@user).to_not be_valid
    end
  end
end
