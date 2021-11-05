class ApplicationController < ActionController::Base
  before_action :authenticate_user!

  protected

  def after_sign_in_path_for(resource)
    edit_user_profile_path(resource)
  end

  def after_sign_out_path_for(_resource)
    root_path
  end
end
