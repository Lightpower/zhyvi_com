json.array!(@feedbacks) do |feedback|
  json.extract! feedback, :event_id, :user_id, :file_link_id, :data
  json.url feedback_url(feedback, format: :json)
end
