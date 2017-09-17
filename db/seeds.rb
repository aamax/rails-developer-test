# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'ffaker'

User.delete_all

vanilla_user = User.create(email: 'vanilla@example.com', password: 'password')

editor_user1 = User.new(email: 'editor1@example.com', password: 'password')
editor_user1.roles=(:editor)
editor_user1.save

editor_user2 = User.new(email: 'editor2@example.com', password: 'password')
editor_user2.roles=(:editor)
editor_user2.save

admin_user = User.new(email: 'admin@example.com', password: 'password')
admin_user.roles=(:admin)
admin_user.save



Article.delete_all

['Local', 'World', 'Sports', 'Social', 'Culture', 'Entertainment'].each do |category|
  (1..20).each do
    [editor_user1, editor_user2].each do |user|
      article = Article.create(category: category, title: FFaker::HipsterIpsum.sentence,
                             content: FFaker::HipsterIpsum.paragraph, user_id: user.id)
    end
  end
end




