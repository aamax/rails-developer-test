# == Schema Information
#
# Table name: articles
#
#  id         :integer          not null, primary key
#  title      :string
#  content    :text
#  category   :string
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'test_helper'

class ArticleTest < ActiveSupport::TestCase
  test "must have title" do
    article = Article.new(content: 'content', category: 'category', user_id: users(:one).id)
    assert_equal(article.valid?, false)
    assert_equal("can't be blank", article.errors.messages[:title].first)
  end

  test "must have category" do
    article = Article.new(title: 'title', content: 'content', user_id: users(:one).id)
    assert_equal(article.valid?, false)
    assert_equal("can't be blank", article.errors.messages[:category].first)
  end

  test "must have user" do
    article = Article.new(title: 'title', content: 'content', category: 'category')
    assert_equal(article.valid?, false)
    assert_equal("can't be blank", article.errors.messages[:user_id].first)
    assert_equal("must exist", article.errors.messages[:user].first)
  end

  test 'editable? must be true if user has editable role' do
    user = users(:one)
    user.roles=(:editor)
    user.save
    article = articles(:one)
    assert_equal(true, article.editable?(user))
  end

  test 'editable? must be false if user does not have editable role' do
    user = users(:one)
    user.save
    article = articles(:one)
    assert_equal(false, article.editable?(user))
  end

  test 'can create article with valid attributes' do
    article = Article.new(title: 'title', content: 'content', category: 'category',
                          user_id: users(:one).id)
    assert_equal(true,article.valid?)
  end

  test 'associations' do
    article = articles(:one)
    assert_equal(users(:one),article.user)
  end
end
