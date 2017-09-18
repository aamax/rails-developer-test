# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string
#  last_sign_in_ip        :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  roles                  :string
#

require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "must have email" do
    user = User.new()
    assert_equal(user.valid?, false)
    assert_equal("can't be blank", user.errors.messages[:email].first)
  end

  test "must have password" do
    user = User.new(email: 'email@example.com')
    assert_equal(user.valid?, false)
    assert_equal("can't be blank", user.errors.messages[:password].first)
  end

  test "is valid with email and password" do
    user = User.new(email: 'email@example.com', password: 'password')
    assert_equal(user.valid?, true)
  end

  test "user gets default :user role" do
    user = User.new(email: 'email@example.com', password: 'password')
    assert_equal(true,user.has_roles?(:user))
  end

  test 'possible roles are :user, :editor and :admin' do
    user = User.new(email: 'email@example.com', password: 'password')
    available = user.available_roles
    assert_equal(3, available.count)
    assert_equal(true, available.include?(:user))
    assert_equal(true, available.include?(:editor))
    assert_equal(true, available.include?(:admin))
  end

  test "associations" do
    article1 = articles(:one)
    article2 = articles(:two)
    user = users(:one)
    user2 = users(:two)
    assert_equal(1, user.articles.count)
    assert_equal(true, user.articles.include?(articles(:one)))
    assert_equal(true, user2.articles.include?(articles(:two)))
    assert_equal(user,article1.user)
    assert_equal(user2, article2.user)
  end

  test 'enforce referential integrity' do
    user = users(:one)
    article = articles(:one)
    assert_difference ['User.count', 'Article.count'], -1 do
      user.destroy
    end
  end
end
