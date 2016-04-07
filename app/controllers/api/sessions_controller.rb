class Api::SessionsController < Devise::SessionsController
  skip_before_filter :authenticate_user_from_token!
  respond_to :json

  def create
    user = User.find_for_database_authentication(email: params[:user][:email])
    if user && user.valid_password?(params[:user][:password])
      auth_token = jwt_token(user)
      render json: { auth_token: auth_token }
    else
      invalid_login_attempt
    end
  end

  private

  def invalid_login_attempt
    render json: { error: t('devise.failure.not_found_in_database') }, status: :unauthorized
  end
end
