# == Schema Information
#
# Table name: accounts
#
#  id         :bigint           not null, primary key
#  dni        :string
#  email      :string
#  kind       :integer
#  number     :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  bank_id    :bigint           not null
#  user_id    :bigint           not null
#
# Indexes
#
#  index_accounts_on_bank_id  (bank_id)
#  index_accounts_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (bank_id => banks.id)
#  fk_rails_...  (user_id => users.id)
#
require "test_helper"

class AccountTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
