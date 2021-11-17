class ProfilesController < ApplicationController
  layout 'without_signed_in', only: [:show]

  def show
    @profile = Profile.find_by(user_id: params[:user_id])
  end

  def edit
    @profile = Profile.find_by(user_id: params[:user_id])
  end

  def update
    @profile = Profile.find_by(user_id: params[:user_id])

    if @profile.update(profile_params)
      redirect_to(edit_user_profile_path(@profile.user_id), notice: 'Perfil actualizado exitosamente')
    else
      flash.now[:errors] = @profile.errors.full_messages
      render :edit
    end
  end

  private

  def profile_params
    params.require(:profile)
          .permit(:full_name, :occupation, :biography, :public, :image)
  end
end
