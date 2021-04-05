require 'rails_helper'
describe 'the logout process', type: :feature do
  before :each do
    User.create(email: 'jake1@gmail.com', password: 'pass', password_confirmation: 'pass')
  end

  it 'logs @user out' do
    visit '/sign_in'
    fill_in 'Email', with: 'jake1@gmail.com'
    fill_in 'Password', with: 'pass'
    click_button 'Sign In'
    click_button 'Logout'
    expect(current_path).to eq(root_path)
    expect(page).to have_text('Logged Out')
  end
end
