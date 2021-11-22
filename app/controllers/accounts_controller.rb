class AccountsController < ApplicationController
  def index
    user = User.find_by(id: params[:user_id])

    authorize user, policy_class: AccountPolicy

    @accounts = policy_scope(Account)
  end

  def new
    user = User.find_by(id: params[:user_id])

    authorize user, policy_class: AccountPolicy

    @account = user.accounts.build
  end

  def create
    user = User.find_by(id: params[:user_id])

    authorize user, policy_class: AccountPolicy

    @account = user.accounts.build(account_params)

    if @account.save
      redirect_to(user_accounts_path(user), notice: 'Account created successfully.')
    else
      flash.now[:errors] = @account.errors.full_messages
      render :new
    end
  end

  def edit
    @account = Account.find_by(id: params[:id])

    authorize @account
  end

  def update
    @account = Account.find_by(id: params[:id])

    authorize @account

    if @account.update(account_params)
      redirect_to(user_accounts_path(current_user), notice: 'Account updated successfully.')
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
