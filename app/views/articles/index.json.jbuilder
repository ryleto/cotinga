json.array!(@articles) do |article|
  json.extract! article, :id, :pubdate, :title, :body, :commentary, :source, :publish, :created_by, :updated_by
  json.url article_url(article, format: :json)
end
