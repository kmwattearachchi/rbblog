class Admin::CommentsController < ApplicationController
  def create
    @article = BlogArticle.find(params[:blog_article_id])
    @comment = @article.comments.create(comment_params)
    redirect_to article_view_url(params[:blog_article_id])
  end

  def destroy
    @blog_article = BlogArticle.find(params[:blog_article_id])
    @comment = @blog_article.comments.find(params[:id])
    @comment.destroy
    redirect_to article_view_url(params[:blog_article_id])
  end

  def show
  end

  private
  def comment_params
    params.require(:comment).permit(:commenter, :body)
  end
end
