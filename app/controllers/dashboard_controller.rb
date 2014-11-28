class DashboardController < ApplicationController
  before_filter :verify_user

  def index
    @comments = current_user.comments.all
    @images = current_user.images.all
    source = current_user.trails.all
    @trails = source.map {|i| DashboardDecorator.new(i)}
  end

  private
  def verify_user
    redirect_to root_path unless current_user
  end
end
