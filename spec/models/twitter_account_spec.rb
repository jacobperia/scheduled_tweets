require 'rails_helper'

RSpec.describe TwitterAccount, type: :model do
  context 'validations tests' do
    it "ensures twitter accounts can't be created externally" do
      twitter_account = TwitterAccount.new(id: 6, user_id: 3, name: 'Jacob Periappuram',
                                           username: 'jacobspeeds', token: 'hd7cdlf8', secret: 'hsdi7sbskdugFJWU78ewkj',
                                           image: 'https://www.google.com/images/branding/googlelogo/1x/googlelogo_color_272x92dp.png')
      expect(twitter_account.valid?).to eq(false)
    end
  end
end
