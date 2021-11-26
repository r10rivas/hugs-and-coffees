# == Schema Information
#
# Table name: coffees
#
#  id         :bigint           not null, primary key
#  message    :string
#  name       :string
#  occupation :string
#  quantity   :integer
#  total      :decimal(, )
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  account_id :bigint           not null
#  user_id    :bigint           not null
#
# Indexes
#
#  index_coffees_on_account_id  (account_id)
#  index_coffees_on_user_id     (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (account_id => accounts.id)
#  fk_rails_...  (user_id => users.id)
#
class Coffee < ApplicationRecord
  belongs_to :user
  belongs_to :account
end
