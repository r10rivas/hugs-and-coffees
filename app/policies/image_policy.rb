class ImagePolicy < ApplicationPolicy
  def index?
    current_user_iqual_resource_owner?(record)
  end

  def create?
    current_user_iqual_resource_owner?(record)
  end

  def update?
    current_user_iqual_resource_owner?(record.user)
  end

  def destroy?
    current_user_iqual_resource_owner?(record.user)
  end

  class Scope
    def initialize(user, scope)
      @user  = user
      @scope = scope
    end

    def resolve
      user.images.with_attached_file.order(id: :desc)
    end

    private

    attr_reader :user, :scope
  end
end
