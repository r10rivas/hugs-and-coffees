# == Schema Information
#
# Table name: hugs
#
#  id         :bigint           not null, primary key
#  duration   :decimal(, )
#  message    :text
#  name       :string
#  occupation :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :bigint           not null
#
# Indexes
#
#  index_hugs_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
class Hug < ApplicationRecord
  belongs_to :user

  validates :duration, :name, :occupation, :message, presence: true
end
