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

class Article < ApplicationRecord
  validates :user_id, :title, :category, presence: true

  belongs_to :user

  scope :ordered_by_date, -> { order(created_at: :desc) }

  def editable?(user)
    user.has_role?(:editor) && self.user == user
  end
end
