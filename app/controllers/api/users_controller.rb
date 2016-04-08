class Api::UsersController < Api::ApplicationController
  before_filter :authenticate_user_from_token!

  def index
    @users = User.all
    render json: @users
  end
end
