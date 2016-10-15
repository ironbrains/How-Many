class Api::UsersController < Api::ApplicationController
  before_filter :authenticate_user_from_token!, except: [:create]
  before_filter :find_user, only: [:show]

  def index
    @users = User.all
    render json: [current_user]
  end

  def show
    render json: @user
  end

  def create
    @user = User.new user_params
    if @user.save
      render json: { auth_token: @user.auth_token, current_user: @user }
    else
      render json: { error: @user.errors }, status: :unauthorized
    end
  end

  def destroy
  end

  protected

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end

  def find_user
    if params[:id] == 'me'
      @user = @current_user
    else
      @user = User.find(params[:id])
    end
  end
end
