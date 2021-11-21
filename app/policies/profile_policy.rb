class ProfilePolicy < ApplicationPolicy
  def update?
    current_user_iqual_resource_owner?(record.user)
  end

  def show?
    record.public?
  end
end