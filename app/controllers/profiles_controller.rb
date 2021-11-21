class ProfilesController < ApplicationController
  layout 'no_login', only: [:show]

  def show
    @profile = Profile.find_by(user_id: params[:user_id])

    @user = @profile.user
  end

  def edit
    @profile = Profile.find_by(user_id: params[:user_id])
  end

  def update
    @profile = Profile.find_by(user_id: params[:user_id])

    if @profile.update(profile_params)
      redirect_to(edit_user_profile_path(@profile.user_id), notice: 'Perfil publicado exitosamente')
    else
      flash.now[:errors] = @profile.errors.full_messages
      render :edit
    end
  end

  def update_status
    @profile = Profile.find_by(user_id: params[:user_id])

    if @profile.update(status_profile_params)
      redirect_to(edit_user_profile_path(@profile.user_id), notice: 'Perfil actualizado exitosamente')
    else
      flash.now[:errors] = @profile.errors.full_messages
      render :edit
    end
  end

  private

  def status_profile_params
    params.require(:profile).permit(:public)
  end

  def profile_params
    params.require(:profile)
          .permit(:full_name, :occupation, :biography, :image, :amount_coffee, :currency_symbol)
  end
end
