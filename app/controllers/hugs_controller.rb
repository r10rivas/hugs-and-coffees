class HugsController < ApplicationController
  skip_before_action :authenticate_user!
  layout 'no_login'

  def set_duration
    @user = User.find_by(id: params[:user_id])
  end

  def new
    @user = User.find_by(id: params[:user_id])
  end

  def create
    user = User.find_by(id: params[:user_id])

    @hug = user.hugs.build(hug_params)

    if @hug.save
      redirect_to(thanks_user_acknowledgments_path(user), notice: 'Recognition successfully registered.')
    else
      flash.now[:errors] = @hug.errors.full_messages
      render :new
    end
  end

  private

  def hug_params
    params.require(:hug)
          .permit(:duration, :name, :occupation, :message)
  end
end
