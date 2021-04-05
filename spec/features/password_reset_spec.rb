require 'rails_helper'
describe 'the password reset process', type: :feature do
  it 'displays email sent for any given email' do
    visit '/password/reset'
    fill_in 'Email', with: 'jake1@gmail.com'
    click_button 'Reset Password'
    expect(current_path).to eq(root_path)
    expect(page).to have_text('Email has been sent if email is valid!')
  end
end
