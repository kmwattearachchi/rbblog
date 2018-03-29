class CreateAdminBlogArticles < ActiveRecord::Migration[5.1]
  def change
    create_table :blog_articles do |t|
      t.string :article_name
      t.text :article_body

      t.timestamps
    end
  end
end
