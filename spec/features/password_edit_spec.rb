require 'rails_helper'
describe 'resets the password', type: :feature do
  before :each do
    User.create(email: 'jake1@gmail.com', password: 'pass', password_confirmation: 'pass')
    visit 'sign_in'
    fill_in 'Email', with: 'jake1@gmail.com'
    fill_in 'Password', with: 'pass'
    click_button 'Sign In'
    expect(page).to have_text('Logged in successfully')
  end

  it 'updates the password successfully' do
    visit '/password'
    fill_in 'Password', with: 'password'
    fill_in 'Password confirmation', with: 'password'
    click_button 'Update Password'
    expect(current_path).to eq(root_path)
    expect(page).to have_text('Password Updated!')
  end

  it 'does not update if passwords do not match' do
    visit '/password'
    fill_in 'Password', with: 'password'
    fill_in 'Password confirmation', with: 'pass'
    click_button 'Update Password'
    expect(current_path).to eq(password_path)
    expect(page).to have_text("Password confirmation doesn't match Password")
  end

  it 'navigates to password path when link to logged in user is clicked' do
    click_link 'jake1@gmail.com'
    expect(current_path).to eq(password_path)
  end
end
