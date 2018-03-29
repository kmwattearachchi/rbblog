class AddAttachmentArticleMainImageToBlogArticles < ActiveRecord::Migration[5.1]
  def self.up
    change_table :blog_articles do |t|
      t.attachment :article_main_image
    end
  end

  def self.down
    remove_attachment :blog_articles, :article_main_image
  end
end
