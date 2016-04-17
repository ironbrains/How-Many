class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  require 'json_web_token'
  protect_from_forgery with: :exception

  protect_from_forgery with: :null_session, if: proc { |c| c.request.format == 'application/json' }

  protected

  def authenticate_user_from_token!
    if claims && (user = User.find_by(email: claims[0]['user']))
      @current_user = user
    else
      invalid_authentication
    end
  end

  # JWT's are stored in the Authorization header using this format:
  def claims
    (auth_header = request.headers['Authorization']) &&
    (token = auth_header.split(' ').last) &&
    JsonWebToken.decode(token)
  rescue
    nil
  end

  def invalid_authentication
    render json: { error: t('devise.failure.unauthenticated') }, status: :unauthorized
  end
end
