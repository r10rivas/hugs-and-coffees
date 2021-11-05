class AccountsController < ApplicationController
  def index
    @user = User.find_by(params[:user_id])
    @accounts = @user.accounts
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

  def edit
    @account = Account.find_by(id: params[:id])
  end

  def update
    @account = Account.find_by(id: params[:id])

    if @account.update(account_params)
      redirect_to(user_accounts_path(current_user), notice: 'Cuenta actualizada exitosamente.')
    else
      flash.now[:errors] = @account.errors.full_messages
      render :edit
    end
  end

  private

  def account_params
    params.require(:account).permit(:bank_id, :kind, :email, :number, :dni)
  end
end
