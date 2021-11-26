# == Schema Information
#
# Table name: hugs
#
#  id         :integer          not null, primary key
#  duration   :decimal(, )
#  message    :text
#  name       :string
#  occupation :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer          not null
#
# Indexes
#
#  index_hugs_on_user_id  (user_id)
#
# Foreign Keys
#
#  user_id  (user_id => users.id)
#
require "test_helper"

class HugTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
