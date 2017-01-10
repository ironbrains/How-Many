class Api::AccountsController < Api::ApplicationController
  def index
  end

  def show
  end

  def create
    @account = current_user.accounts.build account_params
    if @account.save
      render status: :created, json: @account
    else
      render status: :bad_request, nothing: true
    end
  end

  def update
  end

  def destroy
  end

  private

  def account_params
    params.require(:account).permit(:name, :balance, :type)
  end
end
