class ImagesController < ApplicationController
  def index
    @user = User.find_by(params[:user_id])

    @images = @user.images.with_attached_file
  end

  def new
    user = User.find_by(params[:user_id])

    @image = user.images.build
  end

  def create
    user = User.find_by(params[:user_id])

    @image = user.images.build(image_params)

    if @image.save
      redirect_to(user_images_path(user), notice: 'Cuenta creada exitosamente.')
    else
      flash.now[:errors] = @image.errors.full_messages
      render :new
    end
  end

  def edit
    @image = Image.find_by(id: params[:id])
  end

  def update
    @image = Image.find_by(id: params[:id])

    if @image.update(image_params)
      redirect_to(user_images_path(current_user), notice: 'Imagen actualizada exitosamente')
    else
      flash.now[:errors] = @image.errors.full_messages
      render :edit
    end
  end

  def destroy
    @image = Image.find_by(id: params[:id])

    @image.destroy

    redirect_to(user_images_path(current_user), notice: 'Imagen eliminada exitosamente')
  end

  private

  def image_params
    params.require(:image).permit(:caption, :file)
  end
end
