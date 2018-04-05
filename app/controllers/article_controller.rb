class ArticleController < ApplicationController
  before_action :set_blog_article, only: [:view]

  def view
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_blog_article
    @article = BlogArticle.find(params[:id])
    @comments = @article.comments
  end
end
