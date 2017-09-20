require 'test_helper'

# there are many more tests that can be written on this controller and the users_controller
# this is meant to be a pattern/example of the tests to be built to verify
# the system and protect against regression errors.

class ArticlesControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    @article = articles(:one)
  end

  describe "not logged in" do
    setup do
      @user = users(:one)
    end

    test "should get index" do
      get articles_url
      assert_response :success
    end

    test "should not get new" do
      get new_article_url
      assert_response :redirect
      assert_redirected_to new_user_session_url
    end

    test "should not create article" do
      assert_difference('Article.count', 0) do
        post articles_url, params: {article: {category: @article.category,
                                              content: @article.content,
                                              title: @article.title,
                                              user_id: @article.user_id}}
      end

      # assert flash message for error
      assert_redirected_to new_user_session_url
    end

    test "should not show article" do
      get article_url(@article)
      assert_response :redirect
      assert_redirected_to new_user_session_url
    end

    test "should not get edit" do
      get edit_article_url(@article)
      assert_response :redirect
      assert_redirected_to new_user_session_url
    end

    test "should not update article" do
      patch article_url(@article), params: {article: {category: @article.category,
                                                      content: @article.content,
                                                      title: @article.title,
                                                      user_id: @article.user_id}}
      assert_redirected_to new_user_session_url
    end

    test "should not destroy article" do
      assert_difference('Article.count', 0) do
        delete article_url(@article)
      end

      assert_redirected_to new_user_session_url
    end
  end

  describe "logged in as editor" do
    setup do
      @user = users(:one)
      @user.roles=(:editor)
      @user.save

      sign_in(@user)
    end

    test "should get index" do
      get articles_url
      assert_response :success
    end

    test "should get new" do
      get new_article_url
      assert_response :success
    end

    test "should create article" do
      assert_difference('Article.count') do
        post articles_url, params: {article: {category: @article.category,
                                              content: @article.content,
                                              title: @article.title,
                                              user_id: @article.user_id}}
      end

      assert_redirected_to article_url(Article.last)
    end

    test "should show article" do
      get article_url(@article)
      assert_response :success
    end

    test "should get edit" do
      get edit_article_url(@article)
      assert_response :success
    end

    test "should update article" do
      assert_difference('Article.count', 0) do
        patch article_url(@article), params: {article: {category: @article.category,
                                                      content: @article.content,
                                                      title: @article.title,
                                                      user_id: @article.user_id}}
      end

      assert_redirected_to article_url(@article)
    end

    test "should destroy article" do
      assert_difference('Article.count', -1) do
        delete article_url(@article)
      end

      assert_redirected_to articles_url
    end
  end
end
