json.array!(@people) do |person|
  json.extract! person, :id, :name, :twitter_handle, :instagram_name, :twitter_id, :instagram_id
  json.url person_url(person, format: :json)
end
