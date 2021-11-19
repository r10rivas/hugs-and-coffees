class Api::AccountsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def show
    account = Account.find_by(id: params[:id])

    data = {
      email: account.email,
      number: account.number,
      dni: account.dni,
      kind: account.kind
    }

    render json: data
  end
end
