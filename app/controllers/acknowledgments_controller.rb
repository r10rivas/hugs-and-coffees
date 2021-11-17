class AcknowledgmentsController < ApplicationController
  layout 'without_signed_in'

  def new
    @user = User.find_by(id: params[:user_id])
    @profile = @user.profile
  end
end
