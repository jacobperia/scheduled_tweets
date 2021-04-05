require 'rails_helper'
describe 'the signin process', type: :feature do
  it 'signs @user in' do
    User.create(email: 'jake1@gmail.com', password: 'pass', password_confirmation: 'pass')
    visit '/sign_in'
    fill_in 'Email', with: 'jake1@gmail.com'
    fill_in 'Password', with: 'pass'
    click_button 'Sign In'
    expect(current_path).to eq(root_path)
    expect(page).to have_text('Logged in successfully')
    expect(User.last.email).to eq('jake1@gmail.com')
  end

  it "throws error if passwords don't match" do
    visit '/sign_in'
    fill_in 'Email', with: 'jake1@gmail.com'
    fill_in 'Password', with: 'pass1'
    click_button 'Sign In'
    expect(current_path).to eq(sign_in_path)
    expect(page).to have_text('Invalid email or password')
    expect(User.last).to eq(nil)
  end

  it 'throws error if email is invalid' do
    visit '/sign_in'
    fill_in 'Email', with: 'invalid_email'
    fill_in 'Password', with: 'pass'
    click_button 'Sign In'
    expect(current_path).to eq(sign_in_path)
    expect(page).to have_text('Invalid email or password')
    expect(User.last).to eq(nil)
  end
end
