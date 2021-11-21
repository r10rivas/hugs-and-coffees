class ProfilesController < ApplicationController
  layout 'no_login', only: [:show]
  before_action :set_profile, only: %w[show edit update, update_status]
  before_action :authorize_show_profile , only: %w[show]

  def show
    @user = @profile.user
  end

  def edit; end

  def update
    if @profile.update(profile_params)
      redirect_to(edit_user_profile_path(@profile.user_id), notice: 'Perfil actualizado exitosamente')
    else
      flash.now[:errors] = @profile.errors.full_messages
      render :edit
    end
  end

  def update_status
    if @profile.update(status_profile_params)
      redirect_to(edit_user_profile_path(@profile.user_id), notice: 'Perfil actualizado exitosamente')
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

  def authorize_show_profile
    unless @profile.public
      flash[:errors] = 'El perfil no esta publico.'
      redirect_to(request.referrer || root_path)
    end
  end
end
