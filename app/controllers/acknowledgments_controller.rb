class AcknowledgmentsController < ApplicationController
  skip_before_action :authenticate_user!
  layout 'no_login'

  def new
    @user = User.find_by(id: params[:user_id])
  end

  def thanks
    @user = User.find_by(id: params[:user_id])
  end
end
