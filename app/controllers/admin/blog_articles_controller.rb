class Admin::BlogArticlesController < ApplicationController
  before_action :set_blog_article, only: [:edit, :update, :destroy]
  before_action :authenticate_user!,  only: [:edit]

  # GET /admin/blog_articles
  # GET /admin/blog_articles.json
  def index
    #@blog_article = BlogArticle.all
    @filterrific = initialize_filterrific(
        BlogArticle,
        params[:filterrific]
    ) or return
    @blog_article = @filterrific.find.page(params[:page]).per_page(ENV['ADMIN_PER_PAGE'].to_i)

    respond_to do |format|
      format.html
      format.js
    end

  end

  # GET /admin/blog_articles/new
  def new
    @blog_article = BlogArticle.new
  end

  # GET /admin/blog_articles/1/edit
  def edit
  end

  # POST /admin/blog_articles
  # POST /admin/blog_articles.json
  def create
    @blog_article = BlogArticle.new(blog_article_params)
    @blog_article.user_id = current_user.id
    respond_to do |format|
      if @blog_article.save
        format.html { redirect_to admin_blog_articles_url, notice: 'Blog article was successfully created.' }
        #format.json { render :show, status: :created, location: @blog_article }
      else
        format.html { render :new }
        #format.json { render json: @blog_article.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/blog_articles/1
  # PATCH/PUT /admin/blog_articles/1.json
  def update
    respond_to do |format|
      if @blog_article.update(blog_article_params)
        format.html { redirect_to admin_blog_articles_url, notice: 'Blog article was successfully updated.' }
        #format.json { render :show, status: :ok, location: @blog_article }
      else
        format.html { render :edit }
        #format.json { render json: @blog_article.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/blog_articles/1
  # DELETE /admin/blog_articles/1.json
  def destroy
    @blog_article.destroy
    respond_to do |format|
      format.html { redirect_to [:admin,  @blog_article], notice: 'Blog article was successfully destroyed.' }
      #format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_blog_article
      @blog_article = BlogArticle.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def blog_article_params
      params.require(:blog_article).permit(:article_name, :article_body,  :article_main_image,  :category_ids => [])
    end
end
