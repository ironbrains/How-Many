class Api::SessionsController < Devise::SessionsController
  skip_before_filter :authenticate_user_from_token!
  respond_to :json

  def create
    user = User.find_for_database_authentication(email: user_params[:email])
    if user && user.valid_password?(user_params[:password])
      render json: { auth_token: user.auth_token, current_user: user }
    else
      invalid_login_attempt
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password)
  end

  def invalid_login_attempt
    render json: { error: t('devise.failure.not_found_in_database') }, status: :unauthorized
  end
end
