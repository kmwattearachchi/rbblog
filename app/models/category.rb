class Category < ApplicationRecord
  validates :category_name, presence: {message: 'Please enter a category name'}

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
        "categories.category_name LIKE '%"+query+"%'"
    )
  }
  # define ActiveRecord scopes for
  # :search_query, :sorted_by, :with_country_id, and :with_created_at_gte
end
