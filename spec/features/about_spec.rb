require 'rails_helper'
describe 'about page', type: :feature do
  it 'displays a description' do
    visit '/about-us'
    expect(page).to have_text('This is my first ever rails application built from the GoRails.com tutorial')
    expect(page).to have_text('About Us')
  end
end
