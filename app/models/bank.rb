# == Schema Information
#
# Table name: banks
#
#  id         :bigint           not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Bank < ApplicationRecord
  validates :name, presence: true

  has_many :accounts
end
