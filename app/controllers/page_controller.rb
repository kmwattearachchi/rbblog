class PageController < ApplicationController
  before_action :set_blog_article, only: [:home]
  before_action :force_json,  only: :autocomplete

  def home
  end

  def search
    @articles = BlogArticle.ransack(article_name_cont:  params[:q]).result(distinct: true)
  end

  def autocomplete
    @articles = BlogArticle.ransack(article_name_cont:  params[:q]).result(distinct: true).limit(5)
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_blog_article
    @blog_articles = BlogArticle.paginate(:page => params[:page], :per_page => ENV['ADMIN_PER_PAGE'].to_i)
  end

  def force_json
    request.format  = :json
  end

end
