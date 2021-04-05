require 'rails_helper'
describe 'the omniauth process', type: :feature do
  before do
    User.create(email: 'jake1@gmail.com', password: 'pass', password_confirmation: 'pass')
    Rails.application.env_config['omniauth.auth'] = OmniAuth.config.mock_auth[:twitter]
  end

  it 'connects twitter account' do
    visit '/sign_in'
    fill_in 'Email', with: 'jake1@gmail.com'
    fill_in 'Password', with: 'pass'
    click_button 'Sign In'
    expect(current_path).to eq(root_path)
    expect(page).to have_text('Logged in successfully')
    click_button 'Connect Twitter'
    expect(current_path).to eq(twitter_accounts_path)
    expect(page).to have_text('Account connected successfully')
  end
end
