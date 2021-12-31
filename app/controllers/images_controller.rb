class ImagesController < ApplicationController
  def index
    user = User.find_by(id: params[:user_id])

    authorize user, policy_class: ImagePolicy

    @images = policy_scope(Image)
  end

  def new
    user = User.find_by(id: params[:user_id])

    authorize user, policy_class: ImagePolicy

    @image = user.images.build
  end

  def create
    user = User.find_by(id: params[:user_id])

    authorize user, policy_class: ImagePolicy

    @image = user.images.build(image_params)

    if @image.save
      redirect_to(user_images_path(user), notice: 'Image created successfully.')
    else
      flash.now[:errors] = @image.errors.full_messages
      render :new
    end
  end

  def edit
    @image = Image.find_by(id: params[:id])

    authorize @image
  end

  def update
    @image = Image.find_by(id: params[:id])

    authorize @image

    if @image.update(image_params)
      redirect_to(user_images_path(current_user), notice: 'Image updated successfully.')
    else
      flash.now[:errors] = @image.errors.full_messages
      render :edit
    end
  end

  def destroy
    @image = Image.find_by(id: params[:id])

    authorize @image

    @image.destroy

    redirect_to(user_images_path(current_user), notice: 'Image removed successfully.')
  end

  private

  def image_params
    params.require(:image).permit(:caption, :file)
  end
end
