class Person < ActiveRecord::Base
	def pull_tweets
		TWITTER_CLIENT.user_timeline()
	end
end
