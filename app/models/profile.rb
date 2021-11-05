# == Schema Information
#
# Table name: profiles
#
#  id         :integer          not null, primary key
#  biography  :string
#  completed  :boolean          default(FALSE)
#  full_name  :string
#  occupation :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer          not null
#
# Indexes
#
#  index_profiles_on_user_id  (user_id)
#
# Foreign Keys
#
#  user_id  (user_id => users.id)
#
class Profile < ApplicationRecord
  belongs_to :user

  validates :biography, :full_name, :occupation, presence: true

  before_update do
    if biography.present? && full_name.present? &&
      occupation.present? && completed === false
      self.completed = true
    end
  end
end
