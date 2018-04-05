json.articles do
  json.array!(@articles) do |article|
    json.name article.article_name
    json.url article_view_url(article)
  end
end