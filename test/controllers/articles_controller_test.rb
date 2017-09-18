require 'test_helper'

class ArticlesControllerTest < ActionDispatch::IntegrationTest
  # sign in
  # get role user
  # get role editor
  # get role admin

  # view sys as non logged in
  # see home page
  # cannot see show, edit, new
  # cannot delete, update or create

  # sign in as user
  # can see show page and index

  # sign in as editor
  # can show and index articles
  # can CRUD articles
  # cannot CRUD users

  # sign in as admin
  # can show and index articles
  # can CRUD users
  # cannot CRUD articles
  # can index and show articles





  # setup do
  #   @user = FactoryGirl.create(:user)
  #   # @article = FactoryGirl.create(:article, user_id: @user.id)
  # end

  # test "should get index" do
  #   get articles_url
  #   assert_response :success
  # end

  # test "should get new" do
  #   get new_article_url
  #   assert_response :redirect
  # end
  #
  # test "should create article" do
  #   assert_difference('Article.count') do
  #     post articles_url, params: { article: { category: @article.category,
  #                                             content: @article.content,
  #                                             title: @article.title,
  #                                             user_id: @article.user_id } }
  #   end
  #
  #   assert_redirected_to article_url(Article.last)
  # end
  #
  # test "should show article" do
  #   get article_url(@article)
  #   assert_response :redirect
  # end
  #
  # test "should get edit" do
  #   get edit_article_url(@article)
  #   assert_response :redirect
  # end
  #
  # test "should update article" do
  #   patch article_url(@article), params: { article: { category: @article.category,
  #                                                     content: @article.content,
  #                                                     title: @article.title,
  #                                                     user_id: @article.user_id } }
  #   assert_redirected_to article_url(@article)
  # end
  #
  # test "should destroy article" do
  #   assert_difference('Article.count', -1) do
  #     delete article_url(@article)
  #   end
  #
  #   assert_redirected_to articles_url
  # end
end
