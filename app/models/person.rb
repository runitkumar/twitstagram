class Person < ActiveRecord::Base
	
	before_create :get_insta_id

	def get_insta_id
		self.instagram_id = Person.find_instagram_id(self.instagram_name)
	end


	def self.pull_tweets(handle)
		TWITTER_CLIENT.user_timeline("#{handle}").map do |t| 
			t.text
		end
	end

	def self.find_instagram_id(person_name)
		names = JSON.load(RestClient.get("https://api.instagram.com/v1/users/search?q=#{person_name}&client_id=36f9f83c6f2649f48fb72d2ca36c7e45"))
		begin
			id = names["data"].first["id"] 
		rescue 
			puts 'Error'
		end
		id
	end

	#{ENV["instagram_key"]}

	def self.pull_instagrams(id)
		data = JSON.load(RestClient.get("https://api.instagram.com/v1/users/#{id}/media/recent/?client_id=#{ENV["instagram_key"]}"))
		data["data"].map do |link|
			ig = {pic: link["images"]["low_resolution"]["url"], text: link["caption"]["text"]}
		end
	end

	def self.search_for(query)
		where('name LIKE :query OR twitter_handle LIKE :query OR instagram_name LIKE :query', query: "%#{query}%")
	end
end
