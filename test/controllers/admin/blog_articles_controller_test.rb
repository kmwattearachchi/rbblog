require 'test_helper'

class Admin::BlogArticlesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @admin_blog_article = admin_blog_articles(:one)
  end

  test "should get index" do
    get admin_blog_articles_url
    assert_response :success
  end

  test "should get new" do
    get new_admin_blog_article_url
    assert_response :success
  end

  test "should create admin_blog_article" do
    assert_difference('Admin::BlogArticle.count') do
      post admin_blog_articles_url, params: { admin_blog_article: { article_body: @admin_blog_article.article_body, article_name: @admin_blog_article.article_name } }
    end

    assert_redirected_to admin_blog_article_url(Admin::BlogArticle.last)
  end

  test "should show admin_blog_article" do
    get admin_blog_article_url(@admin_blog_article)
    assert_response :success
  end

  test "should get edit" do
    get edit_admin_blog_article_url(@admin_blog_article)
    assert_response :success
  end

  test "should update admin_blog_article" do
    patch admin_blog_article_url(@admin_blog_article), params: { admin_blog_article: { article_body: @admin_blog_article.article_body, article_name: @admin_blog_article.article_name } }
    assert_redirected_to admin_blog_article_url(@admin_blog_article)
  end

  test "should destroy admin_blog_article" do
    assert_difference('Admin::BlogArticle.count', -1) do
      delete admin_blog_article_url(@admin_blog_article)
    end

    assert_redirected_to admin_blog_articles_url
  end
end
