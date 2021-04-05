require 'rails_helper'

RSpec.describe Tweet, type: :model do
  context 'validations tests' do
    it "ensures tweets can't be created externally" do
      tweet = Tweet.new(id: 2, user_id: 3, twitter_account_id: 6, body: 'hi',
                        publish_at: '2021-04-03 18:01:00.000000000 -0400')
      expect(tweet.valid?).to eq(false)
    end
  end
end
