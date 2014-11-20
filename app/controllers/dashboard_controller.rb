class DashboardController < ApplicationController
  before_filter :verify_user
  def index
  end

  private
  def verify_user
    redirect_to root_path unless current_user
  end
end
