class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  require 'json_web_token'
  protect_from_forgery with: :exception

  protect_from_forgery with: :null_session, if: proc { |c| c.request.format == 'application/json' }

  protected

  def authenticate_user_from_token!
    unless @current_user = User.find_by_auth_token(auth_token)
      invalid_authentication
    end
  end

  # JWT's are stored in the Authorization header using this format:
  def auth_token
    request.headers['Authorization']
  rescue
    nil
  end

  def invalid_authentication
    render json: { error: t('devise.failure.unauthenticated') }, status: :unauthorized
  end
end
