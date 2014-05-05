class Person < ActiveRecord::Base
	def self.pull_tweets(th)
		puts TWITTER_CLIENT	
		TWITTER_CLIENT.user_timeline("#{th}").map do |tweet| 
			tweet
		end
	end

	def self.find_instagram_id(person)
		# igkey = '36f9f83c6f2649f48fb72d2ca36c7e45'
		names = JSON.load(RestClient.get("https://api.instagram.com/v1/users/search?q=#{person}&client_id=#{ENV["instagram_key"]}"))
		id = names["data"].first["id"]
		id
	end

	def self.pull_instagrams(id)
		igkey = '36f9f83c6f2649f48fb72d2ca36c7e45'
		data = JSON.load(RestClient.get("https://api.instagram.com/v1/users/#{id}/media/recent/?client_id=#{ENV["instagram_key"]}"))
		
		data["data"].map do |link|
			link = {pic: link["images"]["low_resolution"]["url"]}
			link
		end
	end
end
