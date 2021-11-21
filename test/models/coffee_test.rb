# == Schema Information
#
# Table name: coffees
#
#  id         :integer          not null, primary key
#  message    :string
#  name       :string
#  occupation :string
#  quantity   :integer
#  total      :decimal(, )
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  account_id :integer          not null
#  user_id    :integer          not null
#
# Indexes
#
#  index_coffees_on_account_id  (account_id)
#  index_coffees_on_user_id     (user_id)
#
# Foreign Keys
#
#  account_id  (account_id => accounts.id)
#  user_id     (user_id => users.id)
#
require "test_helper"

class CoffeeTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
