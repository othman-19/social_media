json.extract! friend_request, :id, :user_id, :created_at, :updated_at
json.url friend_request_url(friend_request, format: :json)
