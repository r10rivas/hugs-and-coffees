class HomeController < ApplicationController
  skip_before_action :authenticate_user!
  before_action :authenticated_user

  def index; end

  private

  def authenticated_user
    redirect_to edit_user_profile_path(current_user) if user_signed_in?
  end
end
