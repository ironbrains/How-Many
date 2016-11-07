class Api::DashboardsController < Api::ApplicationController

  def index
    render json: current_user, serializer: Dashboards::IndexSerializer
  end
end
