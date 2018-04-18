class CategoryArticlesController < ApplicationController
  def listCategories
    @article_categories = Category.all()
  end

  def listCategoryArticles
    @category = Category.find(params[:id])
    @blog_articles = BlogArticle.joins(:post_categories,  :categories).where(categories: {id: params[:id]}).uniq
  end
end
