class Person < ActiveRecord::Base
	
	def self.pull_tweets(handle)
		TWITTER_CLIENT.user_timeline("#{handle}").map do |t| 
			t.text
		end
	end

	def self.find_instagram_id(person_name)
		names = JSON.load(RestClient.get("https://api.instagram.com/v1/users/search?q=#{person_name}&client_id=#{ENV["instagram_key"]}"))
		id = names["data"].first["id"]
	end

	def self.pull_instagrams(id)
		data = JSON.load(RestClient.get("https://api.instagram.com/v1/users/#{id}/media/recent/?client_id=#{ENV["instagram_key"]}"))
		data["data"].map do |link|
			ig = {pic: link["images"]["low_resolution"]["url"]}
			if link["caption"].nil?
				ig[:text] = ""
			else
				ig[:text] = link["caption"]["text"]
			end
			ig[:link] = link["link"]
			ig
		end
	end

	def self.instagram_profile_pic(id)
		data = JSON.load(RestClient.get("https://api.instagram.com/v1/users/#{id}/?client_id=#{ENV["instagram_key"]}"))
		pic = data["data"]["profile_picture"]
	end

	def self.search_for(query)
		where('name LIKE :query OR twitter_handle LIKE :query OR instagram_name LIKE :query', query: "%#{query}%")
	end
end
