json.array!(@file_links) do |file_link|
  json.extract! file_link, :type, :url, :user_id
  json.url file_link_url(file_link, format: :json)
end
