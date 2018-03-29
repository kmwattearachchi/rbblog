class Comment < ApplicationRecord
  belongs_to :blog_article
  validates :commenter, presence: true
  validates :body, presence: true
end
