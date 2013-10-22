json.array!(@articles) do |article|
  json.extract! article, :type, :title, :preview, :data, :user_id
  json.url article_url(article, format: :json)
end
