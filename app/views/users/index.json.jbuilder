json.array!(@users) do |user|
  json.extract! user, :id, :fname, :lname, :username, :password, :address
  json.url user_url(user, format: :json)
end
