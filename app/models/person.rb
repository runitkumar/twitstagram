class Person < ActiveRecord::Base
	
	def self.pull_tweets(handle)
		TWITTER_CLIENT.user_timeline("#{handle}").map do |t| 
			t.text
		end
	end

	def self.find_instagram_id(person)
		names = JSON.load(RestClient.get("https://api.instagram.com/v1/users/search?q=#{person}&client_id=#{ENV["instagram_key"]}"))
		id = names["data"].first["id"]
		id
	end

	def self.pull_instagrams(id)
		data = JSON.load(RestClient.get("https://api.instagram.com/v1/users/#{id}/media/recent/?client_id=#{ENV["instagram_key"]}"))
		data["data"].map do |link|
			ig = {pic: link["images"]["low_resolution"]["url"], text: link["caption"]["text"]}
		end
	end
end
