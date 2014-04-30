puts 'LOAD:: Twitter'
TWITTER_CLIENT = Twitter::REST::Client.new do |config|
  config.consumer_key        = "Hv6NtQ3OsG49xDe8Ft8I7pg07"
  config.consumer_secret     = "N9vKE7OFwkaPQCQOp6mDZrooTuev4OolGIRNiuMmEQmz5my9sL"
  config.access_token        = "219790563-KKnJ0zudJHt2nppvdhyHyVOsQ2j9pdAOWMcuDHrH"
  config.access_token_secret = "9zH4NYTWORppPtOoJkWMy7zooIJiXzhkhcAmDlD4wrjIO"
end
