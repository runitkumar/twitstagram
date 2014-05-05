puts 'LOAD:: Twitter'
TWITTER_CLIENT = Twitter::REST::Client.new do |config|
  config.consumer_key        = ENV["tw_consumer_key"]
  config.consumer_secret     = ENV["tw_consumer_secret"]
  config.access_token        = ENV["tw_access_token"]
  config.access_token_secret = ENV["tw_access_token_secret"]
end