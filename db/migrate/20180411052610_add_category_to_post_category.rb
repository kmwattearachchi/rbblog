class AddCategoryToPostCategory < ActiveRecord::Migration[5.1]
  def change
    add_reference :post_categories, :category, foreign_key: true
  end
end
