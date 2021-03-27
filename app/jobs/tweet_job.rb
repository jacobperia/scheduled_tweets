class TweetJob < ApplicationJob
  queue_as :default

  def perform(tweet)
    # binding.irb
    return if tweet.published?

    # Reschedule tweet to the future
    return if tweet.publish_at > Time.current

    tweet.publish_to_twitter!
  end
end

# Push publish_at forward in time
# noon -> 8am

# 8am -> sets tweet id
# noon -> published, does nothing

# push the publish_at forward
# 9am -> 1pm

# 9am -> should do nothing
# 1opm -> should publish tweet and set tweet_id
