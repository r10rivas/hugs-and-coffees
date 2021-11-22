class ApplicationController < ActionController::Base
  before_action :authenticate_user!

  include Pundit

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  protected

  def after_sign_in_path_for(resource)
    edit_user_profile_path(resource)
  end

  def after_sign_out_path_for(_resource)
    root_path
  end

  private

  def user_not_authorized(exception)
    policy_name = exception.policy.class.to_s.underscore
 
    flash[:error] = t("#{policy_name}.#{exception.query}", scope: "pundit", default: :default)
    redirect_to(request.referrer || root_path)
  end
end
