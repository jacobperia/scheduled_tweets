require 'rails_helper'
describe 'schedules tweet', type: :feature do
  before do
    User.create(email: 'jake1@gmail.com', password: 'pass', password_confirmation: 'pass')
    Rails.application.env_config['omniauth.auth'] = OmniAuth.config.mock_auth[:twitter]
  end

  it 'redirects to login page' do
    visit '/tweets'
    expect(current_path).to eq(sign_in_path)
    expect(page).to have_text('Must be signed in!')
  end

  it 'schedules a tweet' do
    visit '/sign_in'
    fill_in 'Email', with: 'jake1@gmail.com'
    fill_in 'Password', with: 'pass'
    click_button 'Sign In'
    expect(current_path).to eq(root_path)
    expect(page).to have_text('Logged in successfully')
    click_button 'Connect Twitter'
    expect(current_path).to eq(twitter_accounts_path)
    expect(page).to have_text('Account connected successfully')
    visit '/tweets'
    click_link 'Schedule a tweet'
    expect(current_path).to eq('/tweets/new')
    fill_in 'Body', with: 'test body'
    click_button 'Schedule'
    expect(current_path).to eq(tweets_path)
    expect(page).to have_text('Tweet scheduled successfully!')
  end

  it 'unschedules a tweet' do
    visit '/sign_in'
    fill_in 'Email', with: 'jake1@gmail.com'
    fill_in 'Password', with: 'pass'
    click_button 'Sign In'
    expect(current_path).to eq(root_path)
    expect(page).to have_text('Logged in successfully')
    click_button 'Connect Twitter'
    expect(current_path).to eq(twitter_accounts_path)
    expect(page).to have_text('Account connected successfully')
    visit '/tweets'
    click_link 'Schedule a tweet'
    expect(current_path).to eq('/tweets/new')
    fill_in 'Body', with: 'test body'
    click_button 'Schedule'
    expect(current_path).to eq(tweets_path)
    expect(page).to have_text('Tweet scheduled successfully!')
  end
end
