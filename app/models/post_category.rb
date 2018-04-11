class PostCategory < ApplicationRecord
  belongs_to :blog_article
  belongs_to :category
end
