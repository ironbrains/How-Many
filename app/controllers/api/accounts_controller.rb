class Api::AccountsController < Api::ApplicationController
  before_filter :authenticate_user_from_token!
  before_filter :find_account, only: [:show, :update, :destroy]

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
    if @account.update account_params
      render status: :created, json: @account
    else
      render status: :bad_request, nothing: true
    end
  end

  def destroy
    if @account.destroy
      render status: :ok, nothing: true
    else
      render status: :bad_request, nothing: true
    end
  end

  private

  def account_params
    params.require(:account).permit(:name, :balance, :type)
  end

  def find_account
    @account = current_user.accounts.find params[:id]
  end
end
