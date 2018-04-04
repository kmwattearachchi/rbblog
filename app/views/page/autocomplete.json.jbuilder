json.articles do
  json.array!(@articles) do |article|
    json.name article.article_name
    json.url admin_blog_article_url(article)
  end
end