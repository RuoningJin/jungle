require 'rails_helper'

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
