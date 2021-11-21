class CoffeesController < ApplicationController
  layout 'no_login'

  def new
    @user = User.find_by(id: params[:user_id])
  end

  def create
    user = User.find_by(params[:user_id])

    @coffee = user.coffees.build(coffee_params)

    if @coffee.save
      redirect_to(user_profile_path(user), notice: 'Reconocimiento registrado exitosamente.')
    else
      flash.now[:errors] = @coffee.errors.full_messages
      render :new
    end
  end

  private

  def coffee_params
    params.require(:coffee)
          .permit(:account_id, :total, :quantity, :name, :occupation, :message)
  end
end
