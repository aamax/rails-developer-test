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
vanilla_user.add_role(:vanilla)

editor_user = User.create(email: 'editor@example.com', password: 'password')
editor_user.add_role(:editor)

admin_user = User.create(email: 'admin@example.com', password: 'password')
admin_user.add_role(:admin)

Article.delete_all

['Local', 'World', 'Sports', 'Social', 'Culture', 'Entertainment'].each do |category|
  (1..20).each do
    article = Article.create(category: category, title: FFaker::HipsterIpsum.sentence,
                             content: FFaker::HipsterIpsum.paragraph, user_id: editor_user.id)
  end
end




