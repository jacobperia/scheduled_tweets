require 'rails_helper'
describe 'home page', type: :feature do
  it 'displays welcome message' do
    visit '/'
    expect(page).to have_text('Welcome to Scheduled Tweets')
  end
end
