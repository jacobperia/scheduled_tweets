require 'rails_helper'

RSpec.describe User, type: :model do
  context 'validations tests' do
    it 'ensures the email is present' do
      user = User.new(password: 'pass', password_confirmation: 'pass')
      expect(user.valid?).to eq(false)
    end

    it 'ensures the password is present' do
      user = User.new(email: 'jake@gmail.com')
      expect(user.valid?).to eq(false)
    end

    it 'ensures user is valid only if email and password are both present' do
      user = User.new(email: 'jake@gmail.com', password: 'pass', password_confirmation: 'pass')
      expect(user.valid?).to eq(true)
    end

    it 'ensures user is valid only if both passwords match' do
      user = User.new(email: 'jake@gmail.com', password: 'pass', password_confirmation: 'pass1')
      expect(user.valid?).to eq(false)
    end

    it 'should be able to save user' do
      user = User.new(email: 'jake@gmail.com', password: 'pass', password_confirmation: 'pass')
      expect(user.save).to eq(true)
    end
  end
end
