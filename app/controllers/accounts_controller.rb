class AccountsController < ApplicationController
  def index
    user = User.find_by(params[:user_id])

    render json: user.accounts
  end

  def new
    user = User.find_by(params[:user_id])

    @account = user.accounts.build
  end

  def create
    user = User.find_by(params[:user_id])
    @account = user.accounts.build(account_params)

    if @account.save
      redirect_to(user_accounts_path(user), notice: 'Cuenta creada exitosamente.')
    else
      flash.now[:errors] = @account.errors.full_messages
      render :new
    end
  end

  private

  def account_params
    params.require(:account).permit(:bank_id, :kind, :email, :number, :dni)
  end
end
