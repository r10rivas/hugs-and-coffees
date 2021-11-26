# == Schema Information
#
# Table name: profiles
#
#  id              :bigint           not null, primary key
#  amount_coffee   :decimal(, )
#  biography       :string
#  completed       :boolean          default(FALSE)
#  currency_symbol :string
#  full_name       :string
#  occupation      :string
#  public          :boolean          default(FALSE)
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  user_id         :bigint           not null
#
# Indexes
#
#  index_profiles_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
require "test_helper"

class ProfileTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
