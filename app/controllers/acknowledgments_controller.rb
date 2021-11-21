class AcknowledgmentsController < ApplicationController
  layout 'no_login'

  def new
    @user = User.find_by(id: params[:user_id])
  end
end
