class BlogArticle < ApplicationRecord
  has_many :comments,  dependent: :destroy
  has_many :post_categories,  dependent: :destroy
  has_many :categories, through: :post_categories

  validates :article_name, presence: true
  validates :article_body, presence: true
  has_attached_file :article_main_image, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :article_main_image, content_type: /\Aimage\/.*\z/
  belongs_to :user
  ratyrate_rateable 'visual_effects', 'original_score', 'director', 'custome_design'

  filterrific(
      default_filter_params: { },
      available_filters: [
          :search_query
      ]
  )

  scope :search_query, lambda { |query|
    # Searches the students table on the 'first_name' and 'last_name' columns.
    # Matches using LIKE, automatically appends '%' to each term.
    # LIKE is case INsensitive with MySQL, however it is case
    # sensitive with PostGreSQL. To make it work in both worlds,
    # we downcase everything.
    return nil  if query.blank?

    # condition query, parse into individual keywords
    #terms = query.downcase.split(/\s+/)

    # replace "*" with "%" for wildcard searches,
    # append '%', remove duplicate '%'s
    #terms = terms.map { |e|
    #  (e.gsub('*', '%') + '%').gsub(/%+/, '%')
    #}
    # configure number of OR conditions for provision
    # of interpolation arguments. Adjust this if you
    # change the number of OR conditions.
    #num_or_conds = 2
    where(
        "blog_articles.article_name LIKE '%"+query+"%' OR blog_articles.article_body LIKE '%"+query+"%'"
    )
  }
  # define ActiveRecord scopes for
  # :search_query, :sorted_by, :with_country_id, and :with_created_at_gte

end
