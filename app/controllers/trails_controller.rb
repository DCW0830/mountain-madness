class TrailsController < ApplicationController
  respond_to :html, :json
  def index
  end

  def search
    if params[:state].length > 0 && params[:city].length > 0
      @trails = Trail.search(params[:state], params[:city])
      respond_with @trails
    elsif params[:city].empty?
      @trails = Trail.search_state(params[:state])
      respond_with @trails
    else
      @trails = Trail.search_city(params[:city])
      respond_with @trails
    end
  end
end
