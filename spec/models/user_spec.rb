require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    it 'should have matching password and password_confirmation' do
      user = User.new(
        first_name: 'John',
        last_name: 'Doe',
        email: 'test@example.com',
        password: 'password',
        password_confirmation: 'different_password'
      )
      expect(user.save).to be false
      expect(user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
  end

  it 'should require unique email addresses (case-insensitive)' do
    existing_user = User.create(
      email: 'test@test.com',
      first_name: 'Existing',
      last_name: 'User',
      password: 'password',
      password_confirmation: 'password'
    )

    user = User.new(
      email: 'TEST@TEST.com',
      first_name: 'John',
      last_name: 'Doe',
      password: 'password',
      password_confirmation: 'password'
    )

    expect(user.save).to be false
    expect(user.errors.full_messages).to include("Email has already been taken")
  end

  it 'should check if password is empty' do
    product = User.new(
      first_name: 'John',
      last_name: 'Doe',
      email: 'test@example.com',
      password: nil,
      password_confirmation: nil
    )
    expect(product.save).to be false
    expect(product.errors.full_messages).to include("Password can't be blank")
  end

  it 'should check if first name is empty' do
    product = User.new(
      first_name: nil,
      last_name: 'Doe',
      email: 'test@example.com',
      password: 'password',
      password_confirmation: 'password'
    )
    expect(product.save).to be false
    expect(product.errors.full_messages).to include("First name can't be blank")
  end

  it 'should check if last name is empty' do
    product = User.new(
      first_name: 'John',
      last_name: nil,
      email: 'test@example.com',
      password: 'password',
      password_confirmation: 'password'
    )
    expect(product.save).to be false
    expect(product.errors.full_messages).to include("Last name can't be blank")
  end

  it 'should check if email is empty' do
    product = User.new(
      first_name: 'John',
      last_name: 'Doe',
      email: nil,
      password: nil,
      password_confirmation: nil
    )
    expect(product.save).to be false
    expect(product.errors.full_messages).to include("Email can't be blank")
  end

  it 'should check if password is longer than 6 characters' do
    product = User.new(
      first_name: 'John',
      last_name: 'Doe',
      email: 'test@example.com',
      password: 'pass',
      password_confirmation: 'pass'
    )
    expect(product.save).to be false
    expect(product.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
  end

  describe '.authenticate_with_credentials' do
  
      it 'authenticates user with spaces in email' do
        authenticated_user = User.authenticate_with_credentials(' example@domain.com ', 'password')
        expect(authenticated_user).to be_nil
      end
  
      it 'does not authenticate user with wrong case in email' do
        authenticated_user = User.authenticate_with_credentials('EXAMPLe@DOMAIN.CoM', 'password')
        expect(authenticated_user).to be_nil
      end
  
      it 'does not authenticate user with incorrect email' do
        authenticated_user = User.authenticate_with_credentials('wrong_email@domain.com', 'password')
        expect(authenticated_user).to be_nil
      end
  
      it 'does not authenticate user with incorrect password' do
        authenticated_user = User.authenticate_with_credentials('example@domain.com', 'wrong_password')
        expect(authenticated_user).to be_nil
      end
    end

end
