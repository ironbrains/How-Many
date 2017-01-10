class Api::DashboardsController < Api::ApplicationController
  before_filter :authenticate_user_from_token!

  def index
    render json: current_user, serializer: Dashboards::IndexSerializer
  end
end
