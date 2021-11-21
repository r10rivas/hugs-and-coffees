# == Schema Information
#
# Table name: images
#
#  id         :integer          not null, primary key
#  caption    :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer          not null
#
# Indexes
#
#  index_images_on_user_id  (user_id)
#
# Foreign Keys
#
#  user_id  (user_id => users.id)
#
class Image < ApplicationRecord
  belongs_to :user

  has_one_attached :file

  validates :caption, presence: true
end
