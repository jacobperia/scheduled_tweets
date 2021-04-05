require 'rails_helper'
describe 'the sign up process', type: :feature do
  before :each do
    User.create(email: 'jake1@gmail.com', password: 'pass', password_confirmation: 'pass')
    visit '/sign_up'
  end
  it 'creates a new user' do
    fill_in 'Email', with: 'jake1@gmail.com'
    fill_in 'Password', with: 'pass'
    fill_in 'Password confirmation', with: 'pass'
    click_button 'Sign Up'
    expect(current_path).to eq(root_path)
    expect(page).to have_text('User successfully created')
  end

  it "doesn't create user if email is invalid" do
    fill_in 'Email', with: 'invalid_email'
    fill_in 'Password', with: 'pass'
    fill_in 'Password confirmation', with: 'pass'
    click_button 'Sign Up'
    expect(current_path).to eq(sign_up_path)
    expect(page).to have_text('Email must be a valid address')
  end

  it "doesn't create user if passwords don't match" do
    fill_in 'Email', with: 'jake1@gmail.com'
    fill_in 'Password', with: 'pass'
    fill_in 'Password confirmation', with: 'pass1'
    click_button 'Sign Up'
    expect(current_path).to eq(sign_up_path)
    expect(page).to have_text("Password confirmation doesn't match Password")
  end
end
