# == Schema Information
#
# Table name: subs
#
#  id          :integer          not null, primary key
#  title       :string           not null
#  description :string           not null
#  user_id     :integer          not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Sub < ActiveRecord::Base
  validates :title, :description, :user_id, presence: true
  validates :title, uniqueness: true

  belongs_to :user
  has_many :sub_posts

  has_many :posts, through: :sub_posts, source: :post

end
