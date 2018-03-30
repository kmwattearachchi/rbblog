class BlogArticle < ApplicationRecord
  has_many :comments,  dependent: :destroy
  validates :article_name, presence: true
  validates :article_body, presence: true
  has_attached_file :article_main_image, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :article_main_image, content_type: /\Aimage\/.*\z/
  belongs_to :user
end
