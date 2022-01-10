class CoffeesController < ApplicationController
  skip_before_action :authenticate_user!
  layout 'no_login'

  def new
    @user = User.find_by(id: params[:user_id])
  end

  def create
    user = User.find_by(id: params[:user_id])

    @coffee = user.coffees.build(coffee_params)

    if @coffee.save
      redirect_to(thanks_user_acknowledgments_path(user), notice: 'Recognition successfully registered.')
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
