require "application_system_test_case"

class ArticlesTest < ApplicationSystemTestCase
  def setup
    setup_data
  end

  describe "home page" do
    describe "not logged in" do
      test "visiting the home" do
        visit root_url
        assert_selector("h1", text: "Article Summary Page")
        # verify_home_page_contents
        page.refute_selector(:css, "a[href='/articles/#{Article.first.id}']")
      end
    end

    describe "logged in as vanilla user" do
      test "visiting the home" do
        login(@user)

        # check that the show links exist
        page.has_selector?("Show Article")
        page.has_selector?(:css, "a[href='/articles/#{Article.first.id}']")
        click_link 'Logout'
      end
    end

    describe "logged in as editor user" do
      test "visiting the home" do
        @user.roles=(:editor)
        @user.save
        login(@user)

        # check that the show links exist
        page.has_selector?("Show Article")
        page.has_selector?(:css, "a[href='/articles/#{Article.first.id}']")

        click_link 'Logout'
      end
    end

    describe "logged in as admin user" do
      test "visiting the home" do
        @user.roles=(:admin)
        @user.save
        login(@user)

        # check that the show links exist
        page.has_selector?("Show Article")
        page.has_selector?(:css, "a[href='/articles/#{Article.first.id}']")

        click_link 'Logout'
      end

    end

    def verify_home_page_contents
      @categories.each do |category|
        page.has_selector?("table##{category}_table")
        assert_equal(4, page.all("table##{category}_table tr").count)
      end
    end
  end


end

def login(a)
  visit root_path
  click_link 'Login / SignUp'
  fill_in 'user[email]', with: a.email
  fill_in 'user[password]', with: 'password'
  click_button 'Log in'
end

def setup_data
  Article.destroy_all

  @user = users(:one)
  @user.password = 'password'
  @user.save

  @user2 = users(:two)
  @user2.password = 'password'
  @user2.save

  (1..3).each do |cat_num|
    category = FFaker::HipsterIpsum.word

    (1..10).each do |article_num|
      Article.create(category: category, title: FFaker::HipsterIpsum.phrase,
                     content: FFaker::HipsterIpsum.sentence, user: @user)
    end
  end
  @categories = Article.all.map {|article| article.category}.uniq
end