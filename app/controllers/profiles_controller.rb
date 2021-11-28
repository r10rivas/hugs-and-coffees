class ProfilesController < ApplicationController
  skip_before_action :authenticate_user!
  before_action :set_profile, only: %i[show edit update update_status]

  def show
    authorize @profile

    @user = @profile.user

    render layout: 'no_login'
  end

  def edit
    authorize @profile
  end

  def update
    authorize @profile

    if @profile.update(profile_params)
      redirect_to(edit_user_profile_path(@profile.user_id), notice: 'Profile updated successfully.')
    else
      flash.now[:errors] = @profile.errors.full_messages
      render :edit
    end
  end

  def update_status
    authorize @profile, :update?

    if @profile.update(status_profile_params)
      redirect_to(edit_user_profile_path(@profile.user_id), notice: 'Profile updated successfully.')
    else
      flash.now[:errors] = @profile.errors.full_messages
      render :edit
    end
  end

  private

  def set_profile
    @profile = Profile.find_by(user_id: params[:user_id])
  end

  def status_profile_params
    params.require(:profile).permit(:public)
  end

  def profile_params
    params.require(:profile)
          .permit(:full_name, :occupation, :biography, :image, :amount_coffee, :currency_symbol)
  end
end
