# == Schema Information
#
# Table name: posts
#
#  id         :integer          not null, primary key
#  title      :string           not null
#  url        :string
#  content    :text             not null
#  user_id    :integer          not null
#  sub_id     :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Post < ActiveRecord::Base
  validates :title, :url, :content, :user_id, presence: true

  belongs_to :user

  has_many :sub_posts

  has_many(
    :subs,
    through: :sub_posts,
    source: :sub
  )
  has_many :comments

end
