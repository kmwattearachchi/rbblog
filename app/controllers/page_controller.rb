class PageController < ApplicationController
  before_action :set_blog_article, only: [:home]
  def home
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_blog_article
    @blog_articles = BlogArticle.all
  end

end
