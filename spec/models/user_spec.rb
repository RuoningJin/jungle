require 'rails_helper'

RSpec.describe User, type: :model do

  describe 'Validations' do

    it 'returns error message when password and password_confirmation are not the same' do
      @user = User.new({password: 'hello', password_confirmation: '123'})
      @user.save

      expect(@user.errors.full_messages[0]).to eql("Password confirmation doesn't match Password")
    end

    it 'returns error message password is nil' do
      @user = User.new({password: nil, password_confirmation: '123'})
      @user.save

      expect(@user.errors.full_messages[0]).to eql("Password can't be blank")
    end

    it 'returns error message when email already exist' do
      @user1 = User.new({name: 'ron jin', email: 'ron@email.com', password: '123', password_confirmation: '123'})
      @user1.save

      @user2 = User.new({name: 'ron jin', email: 'RON@email.com', password: '123', password_confirmation: '123'})
      @user2.save

      expect(@user2.errors.full_messages[0]).to eql("Email has already been taken")
    end

    it 'returns error message when name is nil' do
      @user = User.new({name: nil, email: 'ron@email.com', password: '123', password_confirmation: '123'})
      @user.save

      expect(@user.errors.full_messages[0]).to eql("Name can't be blank")
    end

    it 'returns error message when email is nil' do
      @user = User.new({name: 'ron jin', email: nil, password: '123', password_confirmation: '123'})
      @user.save

      expect(@user.errors.full_messages[0]).to eql("Email can't be blank")
    end

    it 'returns error message when password is too short' do
      @user = User.new({name: 'ron jin', email: 'ron@email.com', password: '12', password_confirmation: '12'})
      @user.save

      expect(@user.errors.full_messages[0]).to eql("Password is too short (minimum is 3 characters)")
    end
  end

  describe '.authenticate_with_credentials' do
    it 'returns true if there are extra spaces before or after email address' do
      @user = User.new({name: 'ron jin', email: 'ron@email.com', password: '123', password_confirmation: '123'})
      @user.save

      expect(User.authenticate_with_credentials('   ron@email.com ', '123')).to be_present
    end

    it 'returns true if the email case the user entered is wrong' do
      @user = User.new({name: 'ron jin', email: 'ron@email.com', password: '123', password_confirmation: '123'})
      @user.save

      expect(User.authenticate_with_credentials('RON@emaIl.com', '123')).to be_present
    end
  end
  
end