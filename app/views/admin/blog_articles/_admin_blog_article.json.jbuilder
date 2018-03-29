json.extract! admin_blog_article, :id, :article_name, :article_body, :created_at, :updated_at
json.url admin_blog_article_url(admin_blog_article, format: :json)
