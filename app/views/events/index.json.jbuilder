json.array!(@events) do |event|
  json.extract! event, :type, :title, :preview, :data, :start_at, :finish_at, :user_id
  json.url event_url(event, format: :json)
end
