class AddBlogArticleToPostCategory < ActiveRecord::Migration[5.1]
  def change
    add_reference :post_categories, :blog_article, foreign_key: true
  end
end
