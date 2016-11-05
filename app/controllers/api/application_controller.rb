class Api::ApplicationController < ApplicationController
  respond_to :json

  protected

  def find_user
    if params[:id] == 'me'
      @user = @current_user
    else
      @user = User.find(params[:id])
    end
  end
end
