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
class Profile < ApplicationRecord
  belongs_to :user

  validates :biography, :full_name, :occupation, :amount_coffee, :currency_symbol, presence: true
  validate :status_publishable, on: :update

  has_one_attached :image

  def status_publishable
    if changed.include?('public')
      errors.add(:public, 'El perfil no cumple las condiciones para ser publicado.') unless publishable? 
    end
  end

  before_update do
    if biography.present? && full_name.present? &&
      occupation.present? && amount_coffee.present? &&
      currency_symbol.present? && completed === false
      self.completed = true
    end
  end

  def first_name
    full_name.split(' ').first
  end

  def publishable?
    completed? && user.accounts.exists?
  end
end
